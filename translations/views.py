from django.contrib import auth
from django.urls import reverse_lazy
from django.views.generic import TemplateView, UpdateView
from django.db.models import Count

from rest_framework import viewsets, serializers
from rest_framework.permissions import BasePermission
from rest_framework.exceptions import ValidationError
from django_filters.rest_framework import DjangoFilterBackend

from .models import Translation, STATUS_DICT, STATUS_CHOICES, STATUS_IN_QUEUE, STATUS_CHECKED


class ViewTranslationPermission(BasePermission):

    def has_object_permission(self, request, view, obj):
        max_translations = 2
        count_trans = Translation.objects.filter(user_translator=request.user).count()
        if request.method == 'GET':
            return request.user.has_perm('translations.view_translation')
        elif request.method == 'PATCH':
            if (count_trans < max_translations or obj.status != STATUS_IN_QUEUE) and \
                    (obj.status == STATUS_IN_QUEUE or request.user == obj.user_translator):
                return True
            elif request.user.groups.values().get()['name'] == 'QA':
                return True
            else:
                return False


class AvailableActionSerializer(serializers.Serializer):
    status = serializers.IntegerField(allow_null=True)

    display = serializers.CharField()
    action = serializers.CharField()


class TranslationSerializer(serializers.ModelSerializer):
    from_status = serializers.IntegerField(write_only=True)
    available_actions = serializers.ListField(child=AvailableActionSerializer(), read_only=True)

    class Meta:
        model = Translation
        fields = ['id', 'txt_original', 'txt_translation', 'status', 'from_status', 'available_actions', 'qa_comment',
                  'on_hold', 'user_translator', 'user_qa']

    def to_representation(self, obj):
        ret = super().to_representation(obj)
        if not ret['on_hold']:
            del ret['on_hold']
        user = self.context['request'].user

        ret['available_actions'] = [
                                       {'status': to_status, 'display': name, 'action': 'change_status'}
                                       for to_status, name in STATUS_CHOICES
                                       if obj.user_can_move_to_status(user, to_status)
                                   ] + (
                                       [{'display': 'Translate', 'action': 'translate'}] if obj.user_can_translate(
                                           user) else []
                                   ) + (
                                       [{'display': 'Add QA Comment',
                                         'action': 'qa_comment'}] if obj.user_can_add_qa_comment(user) else []
                                   )
        return ret

    def update(self, instance, validated_data):
        if 'from_status' in validated_data and instance.status != validated_data['from_status']:
            raise ValidationError('Status is outdated')

        user = self.context['request'].user
        if 'status' in validated_data and not instance.user_can_move_to_status(user, validated_data['status']):
            raise ValidationError('Permission Denied for Status')
        if 'qa_comment' in validated_data and not instance.user_can_add_qa_comment(user):
            raise ValidationError('Permission Denied for QA Comment')
        if 'txt_translation' in validated_data and not instance.user_can_translate(user):
            raise ValidationError('Permission Denied for Translation')

        return super().update(instance, validated_data)


class TranslationViewSet(viewsets.ModelViewSet):
    permission_classes = [ViewTranslationPermission]
    queryset = Translation.objects.all()
    filter_backends = (DjangoFilterBackend,)
    serializer_class = TranslationSerializer
    filterset_fields = ('status',)

    def perform_update(self, serializer):
        if 'status' in self.request.data:
            if self.request.user.groups.filter(name='translators').exists():
                if self.request.data['status'] == STATUS_IN_QUEUE:
                    serializer.save(user_translator=None)
                else:
                    serializer.save(user_translator=self.request.user)
            elif self.request.user.groups.filter(name='QA').exists():
                if self.request.data['status'] == STATUS_IN_QUEUE or self.request.data['status'] == STATUS_CHECKED:
                    serializer.save(user_translator=None)
                else:
                    serializer.save(user_qa=self.request.user)
        else:
            serializer.save()


class IndexView(TemplateView):
    template_name = 'index.html'

    def get_context_data(self, **kwargs):
        data = super().get_context_data(**kwargs)
        user = self.request.user
        if user.has_perm('translations.view_translation'):
            data['statuses'] = [
                dict(display=STATUS_DICT[v['status']], **v)
                for v in sorted(
                    Translation.objects.values('status').annotate(
                        status_count=Count('status')),
                    key=lambda a: a['status']
                )
            ]
        return data


class AddMark(UpdateView):
    model = Translation
    fields = ['txt_original', 'txt_translation', 'mark']
    template_name = 'translations/mark.html'
    success_url = reverse_lazy('home')
