from django.contrib import admin

from .models import GoodsCategory, Goods, GoodsCategoryBrand, GoodsImage, Banner, HotSearchWords, IndexAdGoods


class GoodsCategoryAdmin(admin.ModelAdmin):
    list_display = ('id', 'parent_category', 'name', 'code', 'desc', 'category_type', 'is_tab')
    list_filter = ['is_tab']
    search_fields = ['name']


class GoodsImagesInline(admin.StackedInline):
    model = GoodsImage
    exclude = ['add_time']
    extra = 1


class GoodsAdmin(admin.ModelAdmin):
    list_display = ('id', 'category', 'goods_sn', 'name', 'click_num', 'sold_num', 'fav_num', 'goods_num',
                    'market_price', 'shop_price', 'goods_brief', 'goods_desc', 'ship_free', 'goods_front_image',
                    'is_new', 'is_hot')
    list_filter = ['is_new', 'is_hot']
    search_fields = ['name']

    inlines = [GoodsImagesInline]


class GoodsCategoryBrandAdmin(admin.ModelAdmin):
    list_display = ('id', 'category', 'name', 'desc', 'image')
    search_fields = ['name']

    def get_context(self):
        context = super(GoodsCategoryBrandAdmin, self).get_context()

        if 'form' in context:
            context['form'].fields['category'].queryset = GoodsCategory.objects.filter(category_type=1)

        return context


class GoodsImageAdmin(admin.ModelAdmin):
    list_display = ('id', 'goods', 'image')


class BannerAdmin(admin.ModelAdmin):
    list_display = ('id', 'goods', 'image', 'index')


class HotSearchWordsAdmin(admin.ModelAdmin):
    list_display = ('id', 'keywords', 'index')


class IndexAdGoodsAdmin(admin.ModelAdmin):
    list_display = ('id', 'category', 'goods')

    def get_context(self):
        context = super(IndexAdGoodsAdmin, self).get_context()

        if 'form' in context:
            context['form'].fields['category'].queryset = GoodsCategory.objects.filter(category_type=1)

        return context


admin.site.register(GoodsCategory, GoodsCategoryAdmin)
admin.site.register(Goods, GoodsAdmin)
admin.site.register(GoodsCategoryBrand, GoodsCategoryBrandAdmin)
admin.site.register(GoodsImage, GoodsImageAdmin)
admin.site.register(Banner, BannerAdmin)
admin.site.register(HotSearchWords, HotSearchWordsAdmin)
admin.site.register(IndexAdGoods, IndexAdGoodsAdmin)