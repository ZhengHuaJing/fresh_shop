<template>
  <main class="main">
    <div class="container">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>商品详情</el-breadcrumb-item>
      </el-breadcrumb>
      <section class="detail-mod">
        <el-row>
          <el-col span="8" offset="2">
            <img class="detail-img" :src="current_image.img" alt="">
            <div class="img-bar">
              <a class="arrow-left" @click="lastImg"></a>
              <ul class="thumbnail-list">
                <li v-for="img in carousel_images">
                  <a :class="{active: img.is_active}" @click="setActive(img)">
                    <img :src="img.img" alt="">
                  </a>
                </li>
              </ul>
              <a class="arrow-right" @click="nextImg"></a>
            </div>
          </el-col>
          <el-col span="10">
            <dl class="detail-content">
              <dt class="margin-top-10">
                <h2>{{goods.name}}</h2>
              </dt>
              <el-divider></el-divider>
              <dd>
                <span class="hint">此商品为免运费商品，计算配送金额时将不计入配送费用 </span>
                <ul>
                  <li>
                    <span class="label">市场价</span>
                    <del class="text">￥{{goods.market_price}}元</del>
                  </li>
                  <li>
                    <span class="purchase-icon">抢购</span>
                    <span class="label">促销价</span>
                    <span class="price">￥{{goods.shop_price}}元</span>
                  </li>
                  <li>
                    <span class="label">销&nbsp;&nbsp;&nbsp;量</span>
                    <span class="text">最近售出 <span class="num">{{goods.sold_num}}</span> 件</span>
                  </li>
                  <li>
                    <span class="label">数&nbsp;&nbsp;&nbsp;量</span>
                    <el-input-number v-model="num" :min="1" :max="goods.goods_num" size="mini"></el-input-number>
                    <span class="text"> 件（库存 {{goods.goods_num}} 件）</span>
                  </li>
                  <li>
                    <a class="shopping-cart-btn" href="javascript:" @click="addShoppingCart(goods.id)">
                      <i class="el-icon-shopping-cart-full"></i> 加入购物车
                    </a>
                    <a class="fav-btn" href="javascript:" @click="addFav(goods.id)">
                      <i class="el-icon-star-on"></i> 收藏
                    </a>
                  </li>
                </ul>
              </dd>
            </dl>
          </el-col>
        </el-row>
      </section>
      <div class="left">
        <el-row>
          <el-col class="label" span="4">
            <span class="text">产品名称:</span>
          </el-col>
          <el-col class="content" span="20">
            <span class="text">{{goods.name}}</span>
          </el-col>
        </el-row>
        <el-row>
          <p style="text-align: center" v-html="goods.goods_desc">
          </p>
        </el-row>
      </div>
      <div class="right">
        <el-row>
          <span class="title">热卖商品</span>
        </el-row>
        <el-row style="padding: 10px">
          <ListGoodsItem
              v-for="goods in hot_goodses"
              class="margin-bottom-10"
              width="190px"
              height="290px"
              :id="goods.id"
              :img="goods.goods_front_image"
              :name="goods.name"
              :price="goods.shop_price"
              :sold_num="goods.sold_num"
          ></ListGoodsItem>
        </el-row>
      </div>
    </div>
  </main>
</template>

<script type="text/ecmascript-6">
	import ListGoodsItem from 'components/ListGoodsItem/ListGoodsItem'
  import {getGoods} from "api/goods"
  import {mapState} from 'vuex'

	export default {
    name: 'GoodsDetail',
    data () {
    	return {
				goods: {},
				current_image: {},
				carousel_images: [],
        num: 1,
      }
    },
    methods: {
    	// 单独激活一个
    	setActive (img) {
    		// 清空所有活动图片
    		this.carousel_images.forEach(function (item, index) {
          item.is_active = false
				})
        // 激活点击的图片
        this.current_image = img
        img.is_active = !img.is_active
      },
      // 上一张
			lastImg () {
				let id = this.current_image.id - 2

				if (id >= 0) {
					this.current_image.is_active = false
					this.current_image = this.carousel_images[id]
					this.current_image.is_active = true
				}
			},
      // 下一张
			nextImg () {
				let id = this.current_image.id
        let num = this.carousel_images.length

				if (id < num) {
					this.current_image.is_active = false
					this.current_image = this.carousel_images[id]
					this.current_image.is_active = true
				}
			},
      // 商品轮播图
      setCarouselImages () {
    		this.goods.images.forEach((item, index) => {
    			let is_active = false
    			if (index === 0) {
    				is_active = true
          }

    			this.carousel_images[index] = {
    				'id': index + 1,
    				'img': item.image,
            'is_active': is_active
          }
        })
        this.current_image = this.carousel_images[0]
      },
      // 获取商品详情
      getGoodsDetail (id) {
				getGoods(id)
					.then(response => {
						this.goods = response.data
						this.setCarouselImages()
					})
      },
      // 加入购物车
			addShoppingCart (goods_id) {
        this.$store.dispatch('addShoppingCart', {'goods': goods_id, 'num': this.num})
      },
      // 收藏
			addFav (goods_id) {
        this.$store.dispatch('addFav', {'goods': goods_id})
      }
    },
    components: {
			ListGoodsItem,
    },
    computed: {
    	...mapState(['hot_goodses'])
    },
    created() {
    	// 商品详情
      this.getGoodsDetail(/\d+/.exec(this.$route.fullPath)[0])
      // 热卖商品
      this.$store.dispatch('getGoodses', {'is_hot': 'True'})
		},
	}
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  @import "~common/stylus/variable.styl"
  @import "~common/stylus/mixin.styl"

  .main
    width 100%
    background-color $color-white-s
    .container
      width 1200px
      margin 0 auto
      breadcrumb()
      clearFloat()
      .detail-mod
        padding 20px 0
        height 490px
        border 1px solid $color-white-4l
        .detail-img
          height 380px
          width 380px
        .img-bar
          height 58px
          width 380px
          margin-top 15px
          position relative
          box-sizing border-box
          .arrow-left
            display block
            height 30px
            width 15px
            background url("images/arrow.png") no-repeat
            position absolute
            left 0
            top 30%
          .arrow-right
            display block
            height 30px
            width 15px
            background url("images/arrow.png") -15px 0 no-repeat
            position absolute
            right 0
            top 30%
          .thumbnail-list
            margin 0 25px
            a
              display block
              height 60px
              line-height 60px
              width 56px
              text-align center
              padding-top 10px
              box-sizing border-box
              float left
              margin-right 10px
              &:hover, &.active
                border 1px solid $color-theme
              img
                width 40px
                height 40px
        .detail-content
          dd
            padding-left 30px
            li
              line-height 50px
          .hint
            color $color-black-l
            display block
            margin-bottom 10px
          .label
            color $color-black-3l
            margin-right 20px
          .text
            color $color-black-l
          .purchase-icon
            display block
            width 36px
            border-radius 2px
            background-color $color-theme
            color $color-white
            text-align center
            line-height 20px
            float left
            margin-top 17px
            margin-right 10px
          .price
            font-size $font-size-large-x
            color $color-theme
            font-weight 600
          .num
            color $color-theme
          .shopping-cart-btn
            margin-top 20px
            margin-right 20px
            display block
            width 110px
            height 30px
            line-height 30px
            text-align center
            background-color $color-theme
            color $color-white
            float left
            border 1px solid $color-theme-highlight
            border-radius 3px
          .fav-btn
            margin-top 20px
            display block
            width 80px
            height 30px
            line-height 30px
            text-align center
            background-image linear-gradient($color-white-s, $color-black-s)
            color $color-black-4l
            float left
            border 1px solid $color-black-m
            border-radius 3px
      .left
        float left
        margin-top 20px
        width 970px
        border 1px solid $color-white-4l
        padding 20px
        box-sizing border-box
        .label
          background-color $color-white-m
          text-align right
          height 35px
          line-height 35px
          padding-right 10px
          border 1px solid $color-white-4l
          .text
            color $color-black-4l
            font-weight 600
            font-size $font-size-medium
        .content
          background-color $color-white
          text-align left
          height 35px
          line-height 35px
          padding-left 10px
          border 1px solid $color-white-4l
          .text
            color $color-black-4l
            font-size $font-size-medium
        .goods-img
          margin-top 20px
          width 100%
      .right
        float right
        width 210px
        margin-top 20px
        border 1px solid $color-white-4l
        .title
          font-size $font-size-medium-x
          text-align center
          display block
          height 45px
          line-height 45px
          background-color $color-white-ll
          border-bottom 1px solid $color-white-4l
</style>
























