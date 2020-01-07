<template>
  <a class="goods-item" :href="`/#/home/detail/${id}`" target="_blank">
    <img class="img" :src="img" alt="">
    <span class="name">{{name}}</span>
    <span class="price">￥{{price}}元</span>
  </a>
</template>

<script type="text/ecmascript-6">
  export default {
    name: 'IndexGoodsItem',
    props: [
    	'id',
    	'img',
      'name',
      'price',
    ]
  }
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  @import "~common/stylus/variable.styl"

  .goods-item
    width 230px
    height 200px
    box-sizing border-box
    padding-top 10px
    float left
    .img
      display block
      margin 0 auto
      width 130px
      height 130px
    .name
      margin-top 10px
      text-align center
      display block
      color $color-black-4l
      font-size $font-size-medium
    .price
      margin-top 5px
      text-align center
      display block
      color $color-theme
      font-size $font-size-medium-x
</style>
