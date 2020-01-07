from django.contrib import admin

from .models import OrderInfo, OrderGoods, ShoppingCart


class OrderGoodsInine(admin.StackedInline):
    model = OrderGoods
    exclude = ['add_time']
    extra = 1


class OrderInfoAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'order_sn', 'nonce_str', 'trade_no', 'pay_status', 'pay_type', 'post_script',
                    'order_mount', 'pay_time', 'address', 'signer_name', 'signer_mobile', 'add_time')
    list_filter = ['pay_status', 'pay_type']
    search_fields = ['signer_name']

    inlines = [OrderGoodsInine]


class ShoppingCartAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'goods', 'num', 'add_time')


admin.site.register(OrderInfo, OrderInfoAdmin)
admin.site.register(ShoppingCart, ShoppingCartAdmin)

