<template>
  <a class="goods-item" :href="`/#/goods/${id}`">
    <img class="img" :src="img" alt="">
    <span class="name van-ellipsis">{{name}}</span>
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
    box-sizing border-box
    float left
    height 110px
    width 46%
    position relative
    .img
      display block
      margin 0 auto
      width 110px
      height 55px
    .name
      text-align left
      display block
      color $color-black-4l
      font-size $font-size-small
      padding 0 10px
      margin-top 10px
    .price
      position absolute
      bottom 8px
      left 50%
      transform translateX(-50%)
      text-align center
      display block
      color $color-theme
      font-size $font-size-small-x
</style>
