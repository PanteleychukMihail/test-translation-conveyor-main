from django.contrib import admin
from simple_history.admin import SimpleHistoryAdmin

from .models import Translation

class TranslationAdmin(SimpleHistoryAdmin):
    list_display = ['txt_original', 'txt_translation', 'status', 'user_translator', 'user_qa', 'qa_comment']
    list_filter = ['status']

admin.site.register(Translation, TranslationAdmin)