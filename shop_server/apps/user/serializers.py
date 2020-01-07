import re
from datetime import datetime, timedelta

from user.models import User, VerifyCode

from shop_server.settings import REGEX_EMAIL, REGEX_MOBILE

from rest_framework import serializers
from rest_framework.validators import UniqueValidator


class CodeSerializer(serializers.Serializer):
    """
    邮箱
    """
    email = serializers.CharField(max_length=30, help_text='邮箱')

    def validate_email(self, email):
        # 是否合法
        if not re.match(REGEX_EMAIL, email):
            raise serializers.ValidationError('邮箱非法')

        # 验证码发送频繁, 60秒内发送一次
        noe_minutes_ago = datetime.now() - timedelta(hours=0, minutes=1, seconds=0)
        if VerifyCode.objects.filter(add_time__gt=noe_minutes_ago, email=email).count():
            raise serializers.ValidationError('距离上一次发送未超过60s')

        return email


class UserRegSerializer(serializers.ModelSerializer):
    """
    用户注册
    """
    code = serializers.CharField(help_text='验证码', required=True, write_only=True, max_length=4, min_length=4,
                                 error_messages={
                                     'blank': '请输入验证码',
                                     'required': '请输入验证码',
                                     'max_length': '验证码格式错误',
                                     'min_length': '验证码格式错误'
                                 })
    username = serializers.CharField(help_text='用户名', required=True, allow_blank=False,
                                     validators=[UniqueValidator(queryset=User.objects.all(), message='用户已存在')])
    password = serializers.CharField(help_text='密码', required=True, style={'input_type': 'password'}, write_only=True)

    def validate_code(self, code):
        verify_records = VerifyCode.objects.filter(email=self.initial_data['username']).order_by('-add_time')

        if verify_records:
            last_record = verify_records[0]
            five_minutes_ago = datetime.now() - timedelta(hours=0, minutes=500, seconds=0)

            if five_minutes_ago > last_record.add_time:
                raise serializers.ValidationError('验证码过期')

            if last_record.code != code:
                raise serializers.ValidationError('验证码错误')

        else:
            raise serializers.ValidationError('验证码错误')

    def validate(self, attrs):
        attrs['email'] = attrs['username']
        del attrs['code']
        return attrs

    class Meta:
        model = User
        fields = ('username', 'code', 'password')


class UserDetailSerializer(serializers.ModelSerializer):
    """
    用户详情
    """
    password = serializers.CharField(help_text='密码', min_length=8, max_length=20, allow_blank=True, allow_null=True,
                                     error_messages={
                                         'max_length': '密码不能大于20位',
                                         'min_length': '密码不能小于8位',
                                     })
    email = serializers.EmailField(help_text='邮箱', read_only=True)
    mobile = serializers.CharField(help_text='手机号', max_length=11, min_length=11, allow_blank=True, allow_null=True,
                                   error_messages={
                                       'max_length': '手机号格式错误',
                                       'min_length': '手机号格式错误'
                                   })
    name = serializers.CharField(help_text='姓名', min_length=2, max_length=20, allow_blank=True, allow_null=True,
                                 error_messages={
                                     'max_length': '姓名不能小于两位',
                                     'min_length': '姓名不能大于20位'
                                 })
    gender = serializers.CharField(help_text='性别', max_length=1, min_length=1, allow_blank=True, allow_null=True,
                                   error_messages={
                                       'max_length': '阁下难道是东方不败？',
                                       'min_length': '阁下难道是东方不败？'
                                   })

    def validated_mobile(self, mobile):
        if not re.match(REGEX_MOBILE, mobile):
            raise serializers.ValidationError('手机格式错误')

    def validated_gender(self, gender):
        if (not '男' in gender) or (not '女' in gender):
            raise serializers.ValidationError('阁下难道是东方不败？')

    class Meta:
        model = User
        fields = ('id', 'name', 'gender',  'birthday', 'mobile', 'email', 'password')



























