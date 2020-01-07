from datetime import datetime, timedelta
from random import choice

from django.contrib.auth.backends import ModelBackend
from django.core.mail import send_mail

from .models import User, VerifyCode
from .serializers import CodeSerializer, UserRegSerializer, UserDetailSerializer

from shop_server.settings import EMAIL_FROM

from rest_framework import viewsets, mixins, status, filters
from rest_framework.response import Response
from rest_framework.authentication import SessionAuthentication
from rest_framework.permissions import IsAuthenticated

from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework_jwt.serializers import jwt_payload_handler, jwt_encode_handler


class CustomBackend(ModelBackend):
    """
    自定义用户验证
    """
    def authenticate(self, request,  username=None, password=None, **kwargs):
        try:
            user = User.objects.get(email=username)
            verify_records = VerifyCode.objects.filter(email=username).order_by('-add_time')

            # 邮箱验证码登录
            if verify_records:
                last_record = verify_records[0]
                five_minutes_ago = datetime.now() - timedelta(hours=0, minutes=5, seconds=0)

                if five_minutes_ago < last_record.add_time and last_record.code == password:
                    return user

            # 密码登录
            if user.check_password(password):
                return user

        except Exception as e:
            return None


class CodeCodeViewSet(viewsets.GenericViewSet, mixins.CreateModelMixin):
    """
    create:
        发送邮箱验证码
    """
    serializer_class = CodeSerializer

    def generate_code(self):
        """
        生成4位数字验证码
        :return: 验证码
        """
        seeds = '0123456789'
        random_str = []

        for i in range(4):
            random_str.append(choice(seeds))

        return ''.join(random_str)

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        email = serializer.validated_data['email']
        code = self.generate_code()

        status_code = send_mail(
            '生鲜超市',
            '感谢您使用我们生鲜超市网，您的验证码为：{}'.format(code),
            EMAIL_FROM,
            [email]
        )

        if status_code == 1:
            verify_code = VerifyCode(code=code, email=email)
            verify_code.save()

            return Response(data={'email': email}, status=status.HTTP_201_CREATED)
        else:
            return Response(data={'email': '验证码发送失败'}, status=status.HTTP_400_BAD_REQUEST)


class UserViewSet(viewsets.GenericViewSet, mixins.CreateModelMixin, mixins.RetrieveModelMixin, mixins.UpdateModelMixin,
                  mixins.ListModelMixin):
    """
    create:
        用户注册
    update:
        信息修改
    read:
        用户详情
    list:
        用户列表，搜索
    """

    queryset = User.objects.all()

    # 权限
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)
    # 搜索
    filter_backends = (filters.SearchFilter,)
    search_fields = ('username', 'email')

    def get_serializer_class(self):
        if self.action == 'create':
            return UserRegSerializer
        else:
            return UserDetailSerializer

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        user = self.perform_create(serializer)
        re_dict = serializer.data
        payload = jwt_payload_handler(user)
        re_dict['id'] = user.id
        re_dict["token"] = jwt_encode_handler(payload)
        re_dict["name"] = user.name if user.name else user.username

        headers = self.get_success_headers(serializer.data)
        return Response(re_dict, status=status.HTTP_201_CREATED, headers=headers)

    def perform_create(self, serializer):
        return serializer.save()

    def update(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        user = self.perform_update(serializer)

        #  如果密码是未加密的，则说明是新上传的密码
        if len(user.password) != 78:
            user.set_password(user.password)
            user.save()

        if getattr(instance, '_prefetched_objects_cache', None):
            # If 'prefetch_related' has been applied to a queryset, we need to
            # forcibly invalidate the prefetch cache on the instance.
            instance._prefetched_objects_cache = {}

        return Response(serializer.data)

    def perform_update(self, serializer):
        return serializer.save()

    def get_permissions(self):
        if self.action == 'create' or self.action == 'list':
            return []
        else:
            return [IsAuthenticated()]

    def get_object(self):
        """
        只返回当前用户的信息

        :return: 当前用户
        """
        return self.request.user
















