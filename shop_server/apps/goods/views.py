from .models import Goods, GoodsCategory, HotSearchWords, Banner
from .serializers import GoodsCategorySerializer1, GoodsSerializer, BrandSerializer, IndexCategorySerializer, \
    HotSearchWordsSerializer
from .filters import GoodsCategoryFilter, GoodsFilter

from rest_framework import viewsets, mixins, filters
from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response

from django_filters.rest_framework import DjangoFilterBackend

from rest_framework_extensions.cache.mixins import CacheResponseMixin


class GoodsPagination(PageNumberPagination):
    """
    商品自定义分页
    """
    page_size_query_param = 'page_size'
    page_query_param = 'page'
    max_page_size = 100
    page_size = 12


class GoodsViewSet(CacheResponseMixin, viewsets.GenericViewSet, mixins.ListModelMixin, mixins.RetrieveModelMixin):
    """
    list:
        商品列表，分页，搜索，过滤，排序
    read:
        商品详情
    """
    queryset = Goods.objects.all().order_by()
    serializer_class = GoodsSerializer
    # 分页
    pagination_class = GoodsPagination
    # 过滤
    filter_class = GoodsFilter
    # 搜索和排序
    filter_backends = (DjangoFilterBackend, filters.OrderingFilter, filters.SearchFilter)
    search_fields = ('name', 'goods_brief', 'goods_desc', 'category__name')
    ordering_fields = ('sold_num', 'shop_price')

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.click_num += 1
        instance.save()
        serializer = self.get_serializer(instance)
        return Response(serializer.data)


class GoodsCategoryViewSet(CacheResponseMixin, viewsets.GenericViewSet, mixins.ListModelMixin):
    """
    list:
        分类列表，过滤
    read:
        分类详情
    """
    queryset = GoodsCategory.objects.all()
    serializer_class = GoodsCategorySerializer1
    # 过滤
    filter_backends = (DjangoFilterBackend, )
    filter_class = GoodsCategoryFilter


class BannerViewSet(CacheResponseMixin, viewsets.GenericViewSet, mixins.ListModelMixin):
    """
    list:
        轮播图列表
    """
    queryset = Banner.objects.all().order_by('index')
    serializer_class = BrandSerializer


class IndexCategoryViewSet(CacheResponseMixin, viewsets.GenericViewSet, mixins.ListModelMixin):
    """
    list:
        首页分类列表
    """
    queryset = GoodsCategory.objects.filter(is_tab=True)
    serializer_class = IndexCategorySerializer


class HotSearchWordsViewSet(CacheResponseMixin, viewsets.GenericViewSet, mixins.ListModelMixin):
    """
    list:
        热搜词列表
    """
    queryset = HotSearchWords.objects.all().order_by('index')
    serializer_class = HotSearchWordsSerializer






















