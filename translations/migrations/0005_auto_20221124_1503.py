# Generated by Django 3.2 on 2022-11-24 13:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('translations', '0004_auto_20221121_1227'),
    ]

    operations = [
        migrations.AddField(
            model_name='historicaltranslation',
            name='mark',
            field=models.SmallIntegerField(choices=[], default=0),
        ),
        migrations.AddField(
            model_name='translation',
            name='mark',
            field=models.SmallIntegerField(choices=[], default=0),
        ),
    ]
