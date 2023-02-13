from itertools import permutations

from django.db import models
from django.conf import settings
from django.db.models import Count
from django.urls import reverse
from simple_history.models import HistoricalRecords

STATUS_IN_QUEUE = 10
STATUS_IN_PROCESS = 20
STATUS_TRANSLATED = 30
STATUS_CHECKING = 40
STATUS_CHECKED = 50
STATUS_CHOICES = (
    (STATUS_IN_QUEUE, 'In Queue'),
    (STATUS_IN_PROCESS, 'In Process'),
    (STATUS_TRANSLATED, 'Translated'),
    (STATUS_CHECKING, 'Checking'),
    (STATUS_CHECKED, 'Checked'),
)

STATUS_DICT = dict(STATUS_CHOICES)
MARKS = ((1, "1"), (2, "2"), (3, "3"), (4, "4"), (5, "5"))


class Translation(models.Model):
    txt_original = models.TextField()
    txt_translation = models.TextField(null=True, blank=True)
    status = models.SmallIntegerField(default=STATUS_IN_QUEUE, choices=STATUS_CHOICES)
    on_hold = models.BooleanField(default=False)
    user_translator = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, null=True, blank=True,
                                        related_name='translations')
    user_qa = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, null=True, blank=True,
                                related_name='qas')
    qa_comment = models.TextField(null=True, blank=True)
    due = models.DateTimeField(null=True, blank=True)
    history = HistoricalRecords()
    mark = models.SmallIntegerField(default=0, choices=MARKS)

    def __str__(self):
        return self.txt_original[:20]

    def get_absolute_url(self):
        return reverse('mark', kwargs={'pk': self.pk})

    class Meta:
        permissions = [
                          (
                              f'can_move_from_{statuses[0][0]}_to_{statuses[1][0]}',
                              f'Can move from {statuses[0][1]} to {statuses[1][1]}'
                          )
                          for statuses in permutations(STATUS_CHOICES, 2)
                      ] + [
                          ('can_change_translation', 'Can Change Translation'),
                          ('can_change_qa_comment', 'Can Change QA Comment'),
                      ]

    def user_can_move_to_status(self, user, to_status):
        return to_status != self.status and self.on_hold==False and user.has_perm(
            'translations.can_move_from_{}_to_{}'.format(self.status, to_status))

    def user_can_translate(self, user, status=None):
        status = status or self.status
        return status == STATUS_IN_PROCESS and user.has_perm('translations.can_change_translation')

    def user_can_add_qa_comment(self, user, status=None):
        status = status or self.status
        return status == STATUS_CHECKING and user.has_perm('translations.can_change_qa_comment')
