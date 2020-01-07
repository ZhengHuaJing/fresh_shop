# Generated by Django 2.2 on 2020-01-02 09:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='gender',
            field=models.CharField(blank=True, choices=[('男', '男'), ('女', '女')], help_text='性别', max_length=1, null=True, verbose_name='性别'),
        ),
    ]
