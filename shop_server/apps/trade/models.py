from django.db import models

from user.models import User
from goods.models import Goods


class ShoppingCart(models.Model):
    """
    购物车
    """
    user = models.ForeignKey(User, verbose_name='用户', on_delete=models.CASCADE)
    goods = models.ForeignKey(Goods, verbose_name='商品', on_delete=models.CASCADE)
    num = models.IntegerField('购买数量', default=0)
    add_time = models.DateTimeField('添加时间', auto_now_add=True)

    class Meta:
        db_table = 'shopping_cart'
        verbose_name = '购物车'
        verbose_name_plural = verbose_name


class OrderInfo(models.Model):
    """
    订单信息
    """
    PAY_STATUS_CHOICES = (
        ("已支付", "已支付"),
        ("超时关闭", "超时关闭"),
        ("交易创建", "交易创建"),
        ("交易结束", "交易结束"),
        ("待支付", "待支付")
    )
    PAY_TYPE_CHOICES = (
        ("支付宝", "支付宝"),
        ("微信", "微信")
    )

    user = models.ForeignKey(User, verbose_name='用户', on_delete=models.CASCADE)
    order_sn = models.CharField('订单编号', max_length=50, default='', unique=True)
    nonce_str = models.CharField('随机加密串', max_length=50, default='')
    trade_no = models.CharField('交易号', max_length=50, default='')
    pay_status = models.CharField('订单状态', max_length=20, choices=PAY_STATUS_CHOICES, default='待支付')
    pay_type = models.CharField('支付类型', max_length=10, choices=PAY_STATUS_CHOICES, default='支付宝')
    post_script = models.TextField('订单留言', help_text='订单留言', default='', blank=True, null=True)
    order_mount = models.FloatField('订单金额', help_text='订单金额', default=0.0)
    pay_time = models.DateTimeField('支付时间', blank=True, null=True)
    address = models.CharField('收货地址', help_text='收货地址', max_length=100, default='')
    signer_name = models.CharField('签收人', help_text='签收人', max_length=20, default='')
    signer_mobile = models.CharField('联系电话', help_text='联系电话', max_length=11, default='')
    add_time = models.DateTimeField('添加时间', auto_now_add=True)

    class Meta:
        db_table = 'order_info'
        verbose_name = '订单信息'
        verbose_name_plural = verbose_name


class OrderGoods(models.Model):
    """
    订单内的商品详情
    """
    order = models.ForeignKey(OrderInfo, verbose_name='订单信息', related_name='goods', on_delete=models.CASCADE)
    goods = models.ForeignKey(Goods, verbose_name='商品', on_delete=models.CASCADE)
    goods_num = models.IntegerField('商品数量', default=0)
    add_time = models.DateTimeField('添加时间', auto_now_add=True)

    class Meta:
        db_table = 'order_goods'
        verbose_name = '订单内的商品详情'
        verbose_name_plural = verbose_name


























