from .models import GoodsCategory, Goods, GoodsCategoryBrand, GoodsImage, IndexAdGoods, HotSearchWords, Banner

from django.db.models import Q

from rest_framework import serializers


class GoodsImageSerializer(serializers.ModelSerializer):
    """
    商品轮播图
    """
    class Meta:
        model = GoodsImage
        fields = ['image']


class GoodsCategorySerializer3(serializers.ModelSerializer):
    """
    三级分类
    """
    class Meta:
        model = GoodsCategory
        fields = '__all__'


class GoodsCategorySerializer2(serializers.ModelSerializer):
    """
    二级分类
    """
    sub_cat = GoodsCategorySerializer3(many=True)

    class Meta:
        model = GoodsCategory
        fields = '__all__'


class GoodsCategorySerializer1(serializers.ModelSerializer):
    """
    一级分类
    """
    sub_cat = GoodsCategorySerializer2(many=True)

    class Meta:
        model = GoodsCategory
        fields = '__all__'


class GoodsSerializer(serializers.ModelSerializer):
    """
    商品
    """
    category = GoodsCategorySerializer1()
    images = GoodsImageSerializer(many=True)

    class Meta:
        model = Goods
        fields = '__all__'


class HotSearchWordsSerializer(serializers.ModelSerializer):
    """
    首页热搜词
    """
    class Meta:
        model = HotSearchWords
        fields = '__all__'


class BannerSerializer(serializers.ModelSerializer):
    """
    首页轮播图
    """
    class Meta:
        model = Banner
        fields = '__all__'


class BrandSerializer(serializers.ModelSerializer):
    """
    商品分类品牌
    """
    class Meta:
        model = GoodsCategoryBrand
        fields = '__all__'


class IndexCategorySerializer(serializers.ModelSerializer):
    """
    首页分类
    """
    brand = BrandSerializer(many=True)
    sub_cat = GoodsCategorySerializer2(many=True)
    goods = serializers.SerializerMethodField()
    ad_goods = serializers.SerializerMethodField()

    def get_ad_goods(self, obj):
        goods_json = {}
        ad_goods = IndexAdGoods.objects.filter(category_id=obj.id)

        if ad_goods:
            good_ins = ad_goods[0].goods
            goods_json = GoodsSerializer(good_ins, many=False, context={'request': self.context['request']}).data

        return goods_json

    def get_goods(self, obj):
        all_goods = Goods.objects.filter(Q(category_id=obj.id) | Q(category__parent_category_id=obj.id) |
                                         Q(category__parent_category__parent_category_id=obj.id))
        goods_serializer = GoodsSerializer(all_goods, many=True, context={'request': self.context['request']})

        return goods_serializer.data

    class Meta:
        model = GoodsCategory
        fields = '__all__'




















