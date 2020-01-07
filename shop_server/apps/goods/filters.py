from .models import Goods, GoodsCategory

from django.db.models import Q

import django_filters


class GoodsFilter(django_filters.rest_framework.FilterSet):
    """
    商品过滤
    """
    price_min = django_filters.NumberFilter(help_text='最低价格', field_name='shop_price', lookup_expr='gte')
    price_max = django_filters.NumberFilter(help_text='最高价格', field_name='shop_price', lookup_expr='lte')
    is_hot = django_filters.CharFilter(help_text='是否热门')
    is_new = django_filters.CharFilter(help_text='是否最新')
    top_category = django_filters.NumberFilter(help_text='一级分类ID', method='top_category_filter')
    category_id = django_filters.NumberFilter(help_text='商品所属分类ID')

    def top_category_filter(self, queryset, name, value):
        return queryset.filter(Q(category_id=value) | Q(category__parent_category_id=value) | Q(
            category__parent_category__parent_category_id=value))

    class Meta:
        model = Goods
        fields = ()


class GoodsCategoryFilter(django_filters.rest_framework.FilterSet):
    """
    分类过滤
    """
    class Meta:
        model = GoodsCategory
        fields = ('category_type', 'is_tab', 'parent_category')