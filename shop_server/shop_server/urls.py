"""shop_server URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from goods.views import GoodsViewSet, GoodsCategoryViewSet, HotSearchWordsViewSet, IndexCategoryViewSet
from user.views import CodeCodeViewSet, UserViewSet
from user_operation.views import UserFavViewSet, UserAddressViewSet, UserLeavingMessageViewSet
from trade.views import ShoppingCartViewSet, OrderViewset, AlipayView

from shop_server.settings import MEDIA_ROOT

from django.views.static import serve
from django.contrib import admin
from django.urls import path, include

from rest_framework.documentation import include_docs_urls
from rest_framework.routers import DefaultRouter

from rest_framework_jwt.views import obtain_jwt_token


router = DefaultRouter()
# 商品
router.register('goods', GoodsViewSet, basename='goods')
# 分类
router.register('categorys', GoodsCategoryViewSet, basename='categorys')
# 首页分类
router.register('index_categorys', IndexCategoryViewSet, basename='index_categorys')
# 首页热搜词
router.register('hot_words', HotSearchWordsViewSet, basename='hot_words')
# 验证码
router.register('code', CodeCodeViewSet, basename='code')
# 用户注册
router.register('user', UserViewSet, basename='user')
# 用户收藏
router.register('user_fav', UserFavViewSet, basename='user_fav')
# 用户留言
router.register('user_message', UserLeavingMessageViewSet, basename='user_message')
# 用户地址
router.register('user_address', UserAddressViewSet, basename='user_address')
# 购物车
router.register('shopping_cart', ShoppingCartViewSet, basename='shopping_cart')
# 订单
router.register(r'orders', OrderViewset, basename="orders")


urlpatterns = [
    # 后台
    path('admin/', admin.site.urls),
    # 文件
    path('media/<path:path>', serve, {'document_root': MEDIA_ROOT}),
    # 富文本
    path('ckeditor/', include('ckeditor_uploader.urls')),
    # drf自动认证
    path('api-auth/', include('rest_framework.urls')),
    # drf自动生成api文档◎
    path('docs/', include_docs_urls(title='生鲜后台')),
    # jwt的token认证接口
    path('login/', obtain_jwt_token),
    # 路由
    path('', include(router.urls)),
    # 配置支付宝支付相关接口的url
    path('alipay/return/', AlipayView.as_view()),

]
