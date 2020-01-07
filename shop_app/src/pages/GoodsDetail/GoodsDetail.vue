<template>
  <div class="goods">
    <van-swipe class="goods-swipe" :autoplay="3000">
      <van-swipe-item v-for="img in goods.images">
        <img :src="img.image" >
      </van-swipe-item>
    </van-swipe>

    <van-cell-group>
      <van-cell>
        <div class="goods-title">{{ goods.name }}</div>
        <div class="goods-price">￥{{goods.shop_price}}</div>
      </van-cell>
      <van-cell class="goods-express">
        <van-col span="6">运费：免费</van-col>
        <van-col span="4">剩余：{{ goods.goods_num }}</van-col>
        <van-col span="12" offset="1">
          <span class="pay-num">购买数量：</span>
          <van-stepper v-model="num" min="1" :max="goods.goods_num" input-width="40px" button-size="20px"></van-stepper>
        </van-col>
      </van-cell>
    </van-cell-group>
    <div class="goods-desc">
      <img v-for="img in getDescImages" :src="img" alt="">
    </div>
    <van-goods-action>
      <van-goods-action-icon icon="star-o" @click="addUserFav(goods.id)">
        收藏
      </van-goods-action-icon>
      <van-goods-action-icon icon="cart-o" @click="toShoppingCart">
        购物车
      </van-goods-action-icon>
      <van-goods-action-button type="warning" @click="addShoppingCart">
        加入购物车
      </van-goods-action-button>
      <van-goods-action-button type="danger" @click="orderPay">
        立即购买
      </van-goods-action-button>
    </van-goods-action>
  </div>
</template>

<script type="text/ecmascript-6">
  import { Swipe, SwipeItem, Cell, CellGroup, Col, Stepper, GoodsAction, GoodsActionIcon, GoodsActionButton } from 'vant'
  import { mapState } from 'vuex'

	export default {
    name: 'GoodsDetail',
		data() {
			return {
        num: 1,
			}
		},
    components: {
    	[Swipe.name]: Swipe,
      [SwipeItem.name]: SwipeItem,
      [Cell.name]: Cell,
      [CellGroup.name]: CellGroup,
      [Col.name]: Col,
      [Stepper.name]: Stepper,
      [GoodsAction.name]: GoodsAction,
      [GoodsActionIcon.name]: GoodsActionIcon,
      [GoodsActionButton.name]: GoodsActionButton
    },
		methods: {
    	// 前往购物车
			toShoppingCart () {
				this.$router.push('/shopping_cart')
      },
			// 加入购物车
			addShoppingCart () {
				this.$store.dispatch('addShoppingCart', {'goods': this.goods.id, 'num': this.num})
			},
			// 加入收藏
			addUserFav (goods_id) {
				this.$store.dispatch('addFav', {'goods': goods_id})
			},
			// 立即购买
			orderPay () {
				this.addShoppingCart()
        this.$router.push('/order_pay')
      },
			// 获取商品详情
			getGoodsDetail (id) {
				this.$store.dispatch('getGoods', id)
			},
		},
    computed: {
    	...mapState(['goods']),
    	// 提取html中的图片url
    	getDescImages () {
    		return this.goods.goods_desc.match(/(http.*?jpg)/g)
      }
    },
		created() {
			// 商品详情
			this.getGoodsDetail(/\d+/.exec(this.$route.fullPath)[0])
		},
  }
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  @import "~common/stylus/variable.styl"

  .goods
    background-color $color-white
    .goods-swipe
      img
        width 100%
        display block
    .goods-title
      font-size 16px
    .goods-price
      color $color-red
      font-size $font-size-large-x
    .goods-express
      color $color-black-l
      font-size 12px
      padding 5px 15px
      margin 15px 0
      .van-cell__value
        color $color-black-l
      .pay-num
        position relative
        right -25px
      .van-stepper
        float right
    .goods-tag
      margin-left 5px
    .goods-desc
      img
        width 100%
        height 100%
</style>
