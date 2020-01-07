from django.contrib import admin

from .models import UserFav, UserAddress, UserLeavingMessage


class UserFavAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'goods', 'add_time')


class UserAddressAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'province', 'city', 'district', 'address', 'signer_name', 'signer_mobile', 'add_time')


class UserLeavingMessageAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'message_type', 'message', 'subject', 'add_time')


admin.site.register(UserFav, UserFavAdmin)
admin.site.register(UserAddress, UserAddressAdmin)
admin.site.register(UserLeavingMessage, UserLeavingMessageAdmin)