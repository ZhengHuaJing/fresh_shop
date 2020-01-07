<template>
  <main class="main">
    <el-carousel height="270px">
      <el-carousel-item v-for="image in images" :key="image">
        <img :src="image" alt="">
      </el-carousel-item>
    </el-carousel>
    <div class="container">
      <section class="recommend-mod">
        <el-row>
          <el-col span="5">
            <img class="recommend-img" src="./images/xinpin.0abdd07.jpg" alt="">
          </el-col>
          <el-col span="19">
            <el-row class="margin-top-20">
              <el-col span="4">
                <span class="head-text">刚出炉新品</span>
              </el-col>
              <el-col span="2" offset="18">
                <a class="head-text" href="/#/home/list">更多>></a>
              </el-col>
            </el-row>
            <el-row class="recommend-list" v-for="new_goods in new_goodses">
              <el-col span="6">
                <img :src="new_goods.goods_front_image" alt="">
              </el-col>
              <el-col span="18">
                <el-row>
                  <a class="goods-name" :href="`/#/home/detail/${new_goods.id}`">{{new_goods.name}}</a>
                </el-row>
                <el-row>
                  <span class="reason">[推荐理由] </span>
                  <span class="reason-content">{{new_goods.goods_brief}}</span>
                </el-row>
                <el-row>
                  <el-col span="12">
                    <span class="price">￥{{new_goods.shop_price}}元</span>
                    <del class="original-price">原价:￥{{new_goods.market_price}}元</del>
                  </el-col>
                  <el-col span="12">
                    <span class="sales-volume">销量：{{new_goods.sold_num}}件</span>
                  </el-col>
                </el-row>
              </el-col>
            </el-row>
          </el-col>
        </el-row>
      </section>
      <section class="category-mod" v-for="index_category in index_categorys">
        <el-row>
          <el-col span="4">
            <el-row>
              <span class="category-name">{{index_category.name}}</span>
            </el-row>
            <el-row>
              <ul class="brand-list">
                <li v-for="brand in index_category.brand">
                  <img class="brand-logo" :src="brand.image" alt="">
                </li>
              </ul>
            </el-row>
            <el-row>
              <ul class="type-list">
                <li v-for="sub_cat in index_category.sub_cat.slice(0, 6)">
                  <a href="#">{{sub_cat.name}}</a>
                </li>
              </ul>
            </el-row>
          </el-col>
          <el-col span="6">
            <img class="hot-goods-image" :src="index_category.ad_goods.goods_front_image" alt="商品封面图">
          </el-col>
          <el-col span="14">
            <IndexGoodsItem
                v-for="goods in index_category.goods.slice(1, 7)"
                :id="goods.id"
                :img="goods.goods_front_image"
                :name="goods.name"
                :price="goods.shop_price"
            ></IndexGoodsItem>
          </el-col>
        </el-row>
      </section>
    </div>
  </main>
</template>

<script type="text/ecmascript-6">
  import IndexGoodsItem from 'components/IndexGoodsItem/IndexGoodsItem'
  import {mapState} from 'vuex'

	export default {
    name: 'Index',
    data () {
    	return {
    		images: [
    			require('./images/banner1_SSyqG4g.jpg'),
    			require('./images/banner2_zrA5lCU.jpg'),
    			require('./images/banner3_zqQZJpZ.jpg'),
        ],
      }
    },
    components: {
			IndexGoodsItem,
    },
    computed: {
    	...mapState(['new_goodses', 'index_categorys'])
    },
    created () {
      // 新品推荐
      this.$store.dispatch('getGoodses', {'is_new': 'True'})
      // 大类
      this.$store.dispatch('getIndexCategorys')
		}
	}
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  @import "~common/stylus/variable.styl"
  @import "~common/stylus/mixin.styl"

  .main
    width 100%
    background-color $color-white-s
    padding-bottom 50px
    .el-carousel
      width 100%
    .container
      width 1200px
      margin 0 auto
      .recommend-mod
        width 100%
        border 1px solid $color-white-3l
        margin-top 20px
        background-color $color-white
        .head-text
          font-size $font-size-medium-x
          font-weight 700
          color $color-black-4l
        .recommend-list
          margin-top 10px
          padding 20px 30px
          border-bottom 1px solid $color-black-s
          &:nth-child(3)
            border none
          img
            margin-left 20px
            width 158px
            height 158px
          .goods-name
            display block
            font-weight 500
            font-size $font-size-medium
            color $color-black-5l
            margin-bottom 15px
          .reason
            color $color-black-5l
          .reason-content
            display block
            color $color-black-3l
            margin-bottom 50px
          .price
            font-size $font-size-number
            color $color-red
          .original-price
            margin-left 10px
            font-size $font-size-medium
            color $color-red
          .sales-volume
            display block
            padding-top 15px
            font-size $font-size-medium
            color $color-black-4l
      .category-mod
        margin-top 20px
        height 400px
        width 100%
        background-color $color-white
        border 1px solid $color-white-3l
        .category-name
          display block
          height 80px
          line-height 80px
          background-color $color-theme
          color $color-white
          text-align center
          font-size $font-size-large-x
        .brand-list
          margin-top 10px
          box-sizing border-box
          li
            text-align center
            .brand-logo
              width 100px
              height 70px
              margin 0 auto
        .type-list
          margin-top 20px
          margin-left 20px
          li
            height 25px
            width 50%
            float left
            a
              color $color-black-3l
        .hot-goods-image
          width 290px
          height 400px
</style>























