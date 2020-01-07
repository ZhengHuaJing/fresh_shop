<template>
  <div>
    <van-card
        v-if="shopping_carts.length"
        v-for="shopping_cart in shopping_carts"
        :num="shopping_cart.num"
        :price="shopping_cart.goods.shop_price"
        :desc="shopping_cart.goods.goods_brief"
        :title="shopping_cart.goods.name"
        :thumb="shopping_cart.goods.goods_front_image">
      <div slot="footer">
        <van-button @click="delShoppingCart(shopping_cart.goods.id)" size="mini">删除</van-button>
      </div>
    </van-card>
    <div class="blank-prompt" v-if="!shopping_carts.length">
      <img class="blank-img" src="./images/blank.jpg" alt="">
      <span class="blank-text">购物车中没有商品哦</span>
    </div>
    <van-submit-bar
        :price="getTotalPrice"
        button-text="去结算"
        @submit="goOrderPay">
    </van-submit-bar>
  </div>
</template>

<script type="text/ecmascript-6">
  import { Card, Button, SubmitBar } from 'vant'
  import { mapState, mapGetters } from 'vuex'

  export default {
    name: 'ShoppingCart',
    data () {
			return {}
    },
    components: {
    	[Card.name]: Card,
      [Button.name]: Button,
      [SubmitBar.name]: SubmitBar
    },
    methods: {
			// 删除购物车
			delShoppingCart (goods_id) {
				this.$store.dispatch('delShoppingCart', goods_id)
			},
			// 生成订单并跳转支付页面
			goOrderPay () {
				this.$router.push('/order_pay')
			},
    },
    computed: {
			...mapState(['shopping_carts']),
      ...mapGetters(['getTotalPrice', 'getTotalNum'])
    },
    created() {
			// 获取购物车列表数据
			this.$store.dispatch('getShoppingCarts')
		}
	}
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  @import "~common/stylus/variable.styl"

  .blank-prompt
    background-color $color-white
    .blank-img
      height 100%
      width 100%
    .blank-text
      position absolute
      z-index 100
      top 200px
      left 120px
      color $color-theme
      font-size $font-size-medium-x
</style>
