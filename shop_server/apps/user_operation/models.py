from django.db import models

from user.models import User
from goods.models import Goods


class UserFav(models.Model):
    """
    用户收藏操作
    """
    user = models.ForeignKey(User, verbose_name='用户', on_delete=models.CASCADE)
    goods = models.ForeignKey(Goods, verbose_name='商品', help_text='商品ID', on_delete=models.CASCADE)
    add_time = models.DateTimeField('添加时间', auto_now_add=True)

    class Meta:
        db_table = 'user_fav'
        verbose_name = '用户收藏操作'
        verbose_name_plural = verbose_name


class UserAddress(models.Model):
    """
    用户收货地址
    """
    user = models.ForeignKey(User, verbose_name='用户', on_delete=models.CASCADE)
    province = models.CharField('省份', help_text='省份', max_length=10, default='')
    city = models.CharField('城市', help_text='城市', max_length=30, default='')
    district = models.CharField('区域', help_text='区域', max_length=50, default='')
    address = models.CharField('详细地址', help_text='详细地址', max_length=100, default='')
    signer_name = models.CharField('签收人', help_text='签收人', max_length=30, default='')
    signer_mobile = models.CharField('手机号', help_text='手机号', max_length=11, default='')
    add_time = models.DateTimeField('添加时间', auto_now_add=True)

    class Meta:
        db_table = 'user_address'
        verbose_name = '用户收货地址'
        verbose_name_plural = verbose_name


class UserLeavingMessage(models.Model):
    """
    用户留言
    """
    MESSAGE_TYPE_CHOICES = (
        (1, '留言'),
        (2, '投诉'),
        (3, '询问'),
        (4, '售后'),
        (5, '求购')
    )

    user = models.ForeignKey(User, verbose_name='用户', on_delete=models.CASCADE)
    message_type = models.IntegerField('用户留言类型', help_text='用户留言类型', choices=MESSAGE_TYPE_CHOICES)
    subject = models.CharField('主题', help_text='主题', max_length=50, default='')
    message = models.TextField('留言内容', help_text='留言内容', default='')
    # file = models.FileField('上传的文件', help_text='上传的文件', upload_to='user_operation/files')
    add_time = models.DateTimeField('添加时间', auto_now_add=True)

    class Meta:
        db_table = 'user_leaving_message'
        verbose_name = '用户留言'
        verbose_name_plural = verbose_name

























