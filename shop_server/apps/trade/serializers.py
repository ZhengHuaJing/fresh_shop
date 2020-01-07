import time

from .models import ShoppingCart, OrderInfo, OrderGoods
from goods.serializers import GoodsSerializer
from goods.models import Goods
from utils.alipay import AliPay
from shop_server.settings import RETURN_URL

from rest_framework import serializers


class ShoppingCartSerializer(serializers.Serializer):
    """
    购物车
    """
    user = serializers.HiddenField(default=serializers.CurrentUserDefault())
    num = serializers.IntegerField(help_text='数量', required=True, label='数量', min_value=1,
                                   error_messages={
                                       'required': '请选择购买数量',
                                       'min_value': '商品数量不能小于一'
                                   })
    goods = serializers.PrimaryKeyRelatedField(help_text='商品ID', required=True, queryset=Goods.objects.all())

    def create(self, validated_data):
        user = self.context['request'].user
        num = validated_data['num']
        goods = validated_data['goods']

        existed = ShoppingCart.objects.filter(user=user, goods=goods)

        if existed:
            existed = existed[0]
            existed.num += num
            existed.save()
        else:
            existed = ShoppingCart.objects.create(**validated_data)

        return existed

    def update(self, instance, validated_data):
        instance.num = validated_data['num']
        instance.save()
        return instance


class ShoppingCartDetailSerializer(serializers.ModelSerializer):
    """
    购物车商品详情
    """
    goods = GoodsSerializer(many=False, read_only=True)

    class Meta:
        model = ShoppingCart
        fields = ('goods', 'num')


class OrderGoodsSerializer(serializers.ModelSerializer):
    """
    订单中的商品
    """
    goods = GoodsSerializer(many=False)

    class Meta:
        model = OrderGoods
        fields = '__all__'


class OrderDetailSerializer(serializers.ModelSerializer):
    """
    订单信息详情
    """
    goods = OrderGoodsSerializer(many=True)

    # 支付订单的url
    alipay_url = serializers.SerializerMethodField(read_only=True)

    def get_alipay_url(self, obj):
        alipay = AliPay.getAlipay()

        url = alipay.direct_pay(
            subject=obj.order_sn,
            out_trade_no=obj.order_sn,
            total_amount=obj.order_mount,
            return_url=RETURN_URL
        )
        re_url = "https://openapi.alipaydev.com/gateway.do?{data}".format(data=url)

        return re_url

    class Meta:
        model = OrderInfo
        fields = '__all__'


class OrderSerializer(serializers.ModelSerializer):
    """
    订单信息
    """
    user = serializers.HiddenField(
        default=serializers.CurrentUserDefault()
    )
    # 生成订单的时候这些不用post
    pay_status = serializers.CharField(read_only=True)
    trade_no = serializers.CharField(read_only=True)
    order_sn = serializers.CharField(read_only=True)
    pay_time = serializers.DateTimeField(read_only=True)
    nonce_str = serializers.CharField(read_only=True)
    pay_type = serializers.CharField(read_only=True)

    # 支付订单的url
    alipay_url = serializers.SerializerMethodField(read_only=True)

    def get_alipay_url(self, obj):
        alipay = AliPay.getAlipay()

        url = alipay.direct_pay(
            subject=obj.order_sn,
            out_trade_no=obj.order_sn,
            total_amount=obj.order_mount,
            return_url=RETURN_URL
        )
        re_url = "https://openapi.alipaydev.com/gateway.do?{data}".format(data=url)

        return re_url

    def generate_order_sn(self):
        # 生成订单号
        # 当前时间+userid+随机数
        from random import Random
        random_ins = Random()
        order_sn = "{time_str}{userid}{ranstr}".format(time_str=time.strftime("%Y%m%d%H%M%S"),
                                                       userid=self.context["request"].user.id,
                                                       ranstr=random_ins.randint(10, 99))
        return order_sn

    def validate(self, attrs):
        # validate中添加order_sn，然后在view中就可以save
        attrs["order_sn"] = self.generate_order_sn()
        return attrs

    class Meta:
        model = OrderInfo
        fields = "__all__"

























