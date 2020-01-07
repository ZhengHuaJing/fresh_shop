from django.db import models
from django.contrib.auth.models import AbstractUser


class User(AbstractUser):
    """
    用户信息
    """
    GENDER_CHOICES = {
        ('男', '男'),
        ('女', '女')
    }

    # 用户使用手机注册，所以姓名、生日和邮箱可以为空
    name = models.CharField('姓名', help_text='姓名', max_length=30, null=True, blank=True)
    birthday = models.DateField('出生年月', help_text='出生年月', null=True, blank=True)
    email = models.EmailField('邮箱', help_text='邮箱', max_length=100, unique=True)
    gender = models.CharField('性别', help_text='性别', max_length=1, choices=GENDER_CHOICES, null=True, blank=True)
    mobile = models.CharField('手机号', help_text='手机号', max_length=11, blank=True, null=True)
    add_time = models.DateTimeField('添加时间', auto_now_add=True)

    class Meta:
        db_table = 'user'
        verbose_name = '用户信息'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.username


class VerifyCode(models.Model):
    """
    验证码
    """
    code = models.CharField('验证码', max_length=10)
    email = models.CharField('邮箱', help_text='邮箱', max_length=30)
    add_time = models.DateTimeField('添加时间', auto_now_add=True)

    class Meta:
        db_table = 'verify_code'
        verbose_name = '验证码'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.code