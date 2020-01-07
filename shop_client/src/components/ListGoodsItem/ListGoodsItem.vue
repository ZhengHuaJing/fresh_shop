<template>
  <a class="goods-item" :style="`width: ${width};height: ${height}`" :href="`/#/home/detail/${id}`" target="_blank">
    <img class="image" :src="img" alt="">
    <span class="name">{{name}}</span>
    <span class="price">￥{{price}}元</span>
    <span class="sales-volume">销量：<span class="num">{{sold_num}}</span>件</span>
  </a>
</template>

<script type="text/ecmascript-6">
  export default {
    name: 'ListGoodsItem',
    props: [
    	'width',
			'height',
      'id',
      'img',
      'name',
      'price',
      'sold_num'
    ]
  }
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  @import "~common/stylus/variable.styl"

  .goods-item
    width 225px
    height 290px
    float left
    background-color $color-white
    border 1px solid $color-white-3l
    .image
      display block
      height 60%
      width 100%
    .name
      display block
      font-weight 700
      font-size $font-size-medium-x
      margin-top 20px
      color $color-black-4l
      margin-left 10px
    .price
      display block
      margin 15px 10px
      font-size $font-size-medium-x
      color $color-theme
    .sales-volume
      margin-left 10px
      display block
      color $color-black-3l

</style>
