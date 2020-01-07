from .models import VerifyCode, User

from django.contrib import admin


class UserAdmin(admin.ModelAdmin):
    list_display = ('id', 'email', 'gender', 'mobile', 'add_time')


class VerifyCodeAdmin(admin.ModelAdmin):
    list_display = ('id', 'code', 'email', 'add_time')


admin.site.register(User, UserAdmin)
admin.site.register(VerifyCode, VerifyCodeAdmin)

admin.site.site_title = '后台管理系统'
admin.site.site_header = '生鲜超市后台管理系统'