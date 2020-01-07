from django.db import models

from ckeditor_uploader.fields import RichTextUploadingField


class GoodsCategory(models.Model):
    """
    商品分类
    """
    CATEGORY_TYPE_CHOICES = (
        (1, '一级类目'),
        (2, '二级类目'),
        (3, '三级类目')
    )

    parent_category = models.ForeignKey('self', verbose_name='父类目级别', on_delete=models.CASCADE, blank=True,
                                        null=True, related_name='sub_cat')
    name = models.CharField('类别名', max_length=30, default='')
    code = models.CharField('类别code', max_length=30, default='')
    desc = models.TextField('类型描述', default='')
    category_type = models.IntegerField('类目级别', choices=CATEGORY_TYPE_CHOICES)
    is_tab = models.BooleanField('是否导航', default=False)
    add_time = models.DateTimeField('添加时间', auto_now_add=True)

    class Meta:
        db_table = 'goods_category'
        verbose_name = '商品分类'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class Goods(models.Model):
    """
    商品
    """
    category = models.ForeignKey(GoodsCategory, verbose_name='商品类目', on_delete=models.CASCADE)
    goods_sn = models.CharField('商品唯一货号', max_length=50, default='')
    name = models.CharField('商品名', max_length=30, default='')
    click_num = models.IntegerField('点击数', default=0)
    sold_num = models.IntegerField('商品销售量', default=0)
    fav_num = models.IntegerField('收藏数', default=0)
    goods_num = models.IntegerField('库存数', default=0)
    market_price = models.FloatField('市场价格', default=0.0)
    shop_price = models.FloatField('本店价格', default=0.0)
    goods_brief = models.TextField('商品简短描述', default='')
    goods_desc = RichTextUploadingField(null=True, blank=True)
    ship_free = models.BooleanField('是否承担运费', default=False)
    goods_front_image = models.ImageField('封面图', upload_to='goods/images')
    is_new = models.BooleanField('是否新品', help_text='是否新品', default=False)
    is_hot = models.BooleanField('是否热销', help_text='是否热销', default=False)
    add_time = models.DateTimeField('添加时间', auto_now_add=True)

    class Meta:
        db_table = 'goods'
        verbose_name = '商品'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class GoodsImage(models.Model):
    """
    商品轮播图
    """
    goods = models.ForeignKey(Goods, verbose_name='商品', related_name='images', on_delete=models.CASCADE)
    image = models.ImageField('图片', upload_to='goods/images')
    add_time = models.DateTimeField('添加时间', auto_now_add=True)

    class Meta:
        db_table = 'goods_image'
        verbose_name = '商品轮播图'
        verbose_name_plural = verbose_name


class Banner(models.Model):
    """
    首页轮播的商品
    """
    goods = models.ForeignKey(Goods, verbose_name='商品', on_delete=models.CASCADE)
    image = models.ImageField('轮播图片', upload_to='goods/images')
    index = models.IntegerField('轮播顺序', default=0)
    add_time = models.DateTimeField('添加时间', auto_now_add=True)

    class Meta:
        db_table = 'banner'
        verbose_name = '首页轮播的商品'
        verbose_name_plural = verbose_name


class HotSearchWords(models.Model):
    """
    搜索栏下方热搜词
    """
    keywords = models.CharField('热搜词', max_length=20, default='')
    index = models.IntegerField('排序', default=0)
    add_time = models.DateTimeField('添加时间', auto_now_add=True)

    class Meta:
        db_table = 'hot_search_words'
        verbose_name = '搜索栏下方热搜词'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.keywords


class GoodsCategoryBrand(models.Model):
    """
    某一大类下的宣传商标
    """
    category = models.ForeignKey(GoodsCategory, verbose_name='商品类目', related_name='brand', on_delete=models.CASCADE)
    name = models.CharField('品牌名', max_length=20, default='')
    desc = models.TextField('品牌描述', default='')
    image = models.ImageField('图片', upload_to='goods/images')
    add_time = models.DateTimeField('添加时间', auto_now_add=True)

    class Meta:
        db_table = 'goods_category_brand'
        verbose_name = '某一大类下的宣传商标'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class IndexAdGoods(models.Model):
    """
    首页类别广告商品
    """
    category = models.ForeignKey(GoodsCategory, verbose_name='商品类目', related_name='category',
                                 on_delete=models.CASCADE)
    goods = models.ForeignKey(Goods, verbose_name='商品', related_name='goods', on_delete=models.CASCADE)
    add_time = models.DateTimeField('添加时间', auto_now_add=True)

    class Meta:
        db_table = 'index_ad_goods'
        verbose_name = '首页商品类别广告'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.goods.name





























