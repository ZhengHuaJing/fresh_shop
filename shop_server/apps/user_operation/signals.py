from goods.serializers import GoodsSerializer

from .models import UserFav, UserAddress, UserLeavingMessage

from rest_framework import serializers
from rest_framework.validators import UniqueTogetherValidator


class UserFavSerializer(serializers.ModelSerializer):
    """
    用户收藏
    """
    user = serializers.HiddenField(default=serializers.CurrentUserDefault())

    class Meta:
        model = UserFav
        fields = ('id', 'user', 'goods')
        validators = [
            UniqueTogetherValidator(
                queryset=UserFav.objects.all(),
                fields=('user', 'goods'),
                message='已经收藏'
            )
        ]


class UserFavDetailSerializer(serializers.ModelSerializer):
    """
    用户收藏详情
    """
    goods = GoodsSerializer()

    class Meta:
        model = UserFav
        fields = ('id', 'goods')


class UserAddressSerializer(serializers.ModelSerializer):
    """
    收货地址
    """
    user = serializers.HiddenField(default=serializers.CurrentUserDefault())

    class Meta:
        model = UserAddress
        fields = '__all__'


class UserLeavingMessageSerializer(serializers.ModelSerializer):
    """
    用户留言
    """
    user = serializers.HiddenField(default=serializers.CurrentUserDefault())

    class Meta:
        model = UserLeavingMessage
        fields = '__all__'



















