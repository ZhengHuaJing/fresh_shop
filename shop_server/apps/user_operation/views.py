from .serializers import UserFavSerializer, UserFavDetailSerializer, UserAddressSerializer, UserLeavingMessageSerializer
from .models import UserFav, UserAddress, UserLeavingMessage
from utils.permissions import IsOwnerOrReadOnly

from rest_framework import viewsets, mixins
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import SessionAuthentication

from rest_framework_jwt.authentication import JSONWebTokenAuthentication


class UserFavViewSet(viewsets.GenericViewSet, mixins.ListModelMixin, mixins.CreateModelMixin, mixins.DestroyModelMixin):
    """
    create:
        添加收藏
    destroy:
        取消收藏
    list:
        收藏列表
    """
    # 权限
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)
    # 搜索字段
    lookup_field = 'goods_id'

    def get_queryset(self):
        return UserFav.objects.filter(user=self.request.user)

    def get_serializer_class(self):
        if self.action == 'list':
            return UserFavDetailSerializer
        else:
            return UserFavSerializer


class UserAddressViewSet(viewsets.GenericViewSet, mixins.ListModelMixin, mixins.CreateModelMixin,
                         mixins.UpdateModelMixin, mixins.DestroyModelMixin):
    """
    create:
        增加地址
    delete:
        删除地址
    update:
        修改地址
    list:
        地址列表
    """
    serializer_class = UserAddressSerializer
    # 权限
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)

    def get_queryset(self):
        return UserAddress.objects.filter(user=self.request.user)


class UserLeavingMessageViewSet(viewsets.GenericViewSet, mixins.ListModelMixin, mixins.CreateModelMixin,
                                mixins.UpdateModelMixin, mixins.DestroyModelMixin):
    """
    create:
        增加留言
    delete:
        删除留言
    update:
        修改留言
    list:
        留言列表
    """
    serializer_class = UserLeavingMessageSerializer
    # 权限
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)

    def get_queryset(self):
        return UserLeavingMessage.objects.filter(user=self.request.user)




























