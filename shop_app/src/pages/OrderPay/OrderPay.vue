<template>
  <div>
    <van-panel title="商品列表">
      <van-card
          v-for="shopping_cart in shopping_carts"
          :num="shopping_cart.num"
          :price="shopping_cart.goods.shop_price"
          :desc="shopping_cart.goods.goods_brief"
          :title="shopping_cart.goods.name"
          :thumb="shopping_cart.goods.goods_front_image">
      </van-card>
      <van-cell class="hint" title="订单中无商品" v-show="!this.shopping_carts.length"></van-cell>
    </van-panel>
    <van-panel class="address-list" title="配送地址">
      <a class="add-address" href="/#/user_address_add">添加地址</a>
      <van-radio-group v-model="radio">
        <van-radio :name="index" v-for="(address, index) in addresses" :key="index">
          <van-cell
              :title="`${address.signer_name} ${address.signer_mobile}`"
              :label="`${address.province}${address.city}${address.district}${address.address}`">
          </van-cell>
        </van-radio>
      </van-radio-group>
    </van-panel>
    <van-panel title="支付方式">
      <van-radio-group :v-model="1">
        <van-radio>
          <img class="zfb_img" src="./images/zfb.jpg" alt="">
        </van-radio>
      </van-radio-group>
    </van-panel>
    <van-panel title="留言内容">
      <van-field
          v-model="post_script"
          rows="2"
          autosize
          label="留言"
          type="textarea"
          maxlength="300"
          placeholder="请输入留言"
          show-word-limit>
      </van-field>
    </van-panel>
    <van-submit-bar
        :price="getTotalPrice"
        button-text="提交订单"
        @submit="createOrder">
    </van-submit-bar>
  </div>
</template>

<script type="text/ecmascript-6">
  import { Panel, Card, Cell, Radio, RadioGroup, Field, SubmitBar } from 'vant'
  import { mapState, mapGetters } from 'vuex'

  export default {
    name: 'OrderPay',
    data () {
    	return {
				radio: 0,
				post_script: '',
      }
    },
    components: {
    	[Panel.name]: Panel,
      [Card.name]: Card,
      [Cell.name]: Cell,
      [Radio.name]: Radio,
      [RadioGroup.name]: RadioGroup,
      [Field.name]: Field,
      [SubmitBar.name]: SubmitBar
    },
    methods: {
			// 去结算
			createOrder () {
				let address = this.addresses[this.radio]
				if (!address) {
					this.$toast.fail('请添加收货地址')

				} else if (!this.shopping_carts.length) {
					this.$toast.fail('订单中没有商品')
				} else {
					this.$store.dispatch('addOrder', {
						'post_script': this.post_script,
						'order_mount': this.getTotalPrice / 100,
						'address': address.province + address.city + address.district + address.address,
						'signer_name': address.signer_name,
						'signer_mobile': address.signer_mobile
					})
        }
			},
    },
    computed: {
    	...mapState(['shopping_carts', 'addresses']),
      ...mapGetters(['getTotalPrice'])
    },
    created() {
			// 购物车列表
			this.$store.dispatch('getShoppingCarts')
			// 地址列表
			this.$store.dispatch('getAddresses')
		}
	}
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  @import "~common/stylus/variable.styl"

  .van-radio-group
    .van-radio
      padding-left 10px
      .van-cell
        width 300px
      .zfb_img
        height 90px
        width 120px
  .address-list
    padding-bottom 20px
    background-color $color-white
    .add-address
      display block
      width 70px
      height 30px
      line-height 30px
      text-align center
      margin-left 15px
      background-color $color-theme
      border-radius 3px
      color $color-white
  .hint
    color $color-red
</style>
