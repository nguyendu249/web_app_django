# Generated by Django 4.1.1 on 2022-10-07 01:15

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('course', '0004_alter_course_video_intro'),
    ]

    operations = [
        migrations.AlterField(
            model_name='course',
            name='price',
            field=models.FloatField(default=0),
        ),
    ]