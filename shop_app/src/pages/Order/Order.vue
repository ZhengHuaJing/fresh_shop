<template>
  <div>
    <van-tabs v-model="active">
      <van-tab title="全部">
        <van-card
            v-for="order_goods in order_goodses"
            :num="order_goods.goods_num"
            :price="order_goods.goods.shop_price"
            :desc="order_goods.goods.goods_brief"
            :title="order_goods.goods.name"
            :thumb="order_goods.goods.goods_front_image"
            @click="goodsDetail(order_goods.goods.id)"
        ></van-card>
      </van-tab>
      <van-tab title="待支付">
        <van-card
            v-for="order_goods in getNotPayGoods"
            :num="order_goods.goods_num"
            :price="order_goods.goods.shop_price"
            :desc="order_goods.goods.goods_brief"
            :title="order_goods.goods.name"
            :thumb="order_goods.goods.goods_front_image"
            @click="goodsDetail(order_goods.goods.id)"
        ></van-card>
      </van-tab>
      <van-tab title="已支付">
        <van-card
            v-for="order_goods in getPayGoods"
            :num="order_goods.goods_num"
            :price="order_goods.goods.shop_price"
            :desc="order_goods.goods.goods_brief"
            :title="order_goods.goods.name"
            :thumb="order_goods.goods.goods_front_image"
            @click="goodsDetail(order_goods.goods.id)"
        ></van-card>
      </van-tab>
    </van-tabs>
  </div>
</template>

<script type="text/ecmascript-6">
  import { Tabs, Tab, Card } from 'vant'
  import { mapGetters, mapState } from 'vuex'

  export default {
    name: 'Order',
    data () {
      return {
				active: 0,
      }
    },
    components: {
    	[Tabs.name]: Tabs,
      [Tab.name]: Tab,
      [Card.name]: Card
    },
    methods: {
			// 跳转商品详情页
			goodsDetail (goods_id) {
				this.$router.push('/goods/' + goods_id)
			}
    },
    computed: {
    	...mapState(['order_goodses']),
      ...mapGetters(['getPayGoods', 'getNotPayGoods'])
    },
    created() {
    	// 订单列表
    	this.$store.dispatch('getOrders')
      console.log(this.order_goodses)
		}
	}
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">

</style>
