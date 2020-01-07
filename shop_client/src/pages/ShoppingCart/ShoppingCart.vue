<template>
  <div>
    <header class="header">
      <div class="container">
        <el-row>
          <el-col span="12">
            <ul class="btn-list">
              <li>
                <a href="/#/home/index">网站首页</a>
              </li>
              <li>
                <a href="/#/home/user_center/user_info">{{user_token.username}}</a>
              </li>
              <li>
                <a href="/#/user/login" @click="logout">退出</a>
              </li>
            </ul>
          </el-col>
          <el-col span="12">
            <ul class="step-list">
              <li class="caret">
                <span class="num-icon">1</span>
                <span class="text">我的购物车</span>
                <span class="arrow"></span>
              </li>
              <li class="caret">
                <span class="num-icon">2</span>
                <span class="text">确认订单信息</span>
                <span class="arrow"></span>
              </li>
              <li>
                <span class="num-icon off">3</span>
                <span class="text">支付</span>
              </li>
            </ul>
          </el-col>
        </el-row>
      </div>
    </header>
    <main class="main">
      <div class="container">
        <div class="order-mod">
          <dl>
            <dt>
              <el-row>
                <el-col span="10">
                  {{getTotalNum}} 件商品
                </el-col>
                <el-col span="4">
                  单价
                </el-col>
                <el-col span="4">
                  数量
                </el-col>
                <el-col span="4">
                  小计
                </el-col>
                <el-col span="2">
                  操作
                </el-col>
              </el-row>
            </dt>
            <dd>
              <!--<span v-show="!shopping_carts">购物车无商品</span>-->
              <el-row v-for="shopping_cart in shopping_carts">
                <el-col span="10">
                  <img class="goods-img" :src="shopping_cart.goods.goods_front_image" alt="">
                  <a class="goods-name" :href="`/#/home/detail/${shopping_cart.goods.id}`">
                    {{shopping_cart.goods.name}}
                  </a>
                </el-col>
                <el-col span="3">
                  <span class="text">￥{{shopping_cart.goods.shop_price}}元</span>
                </el-col>
                <el-col span="5">
                  <div class="input-number">
                    <div class="left">
                      <a class="del" @click="delBtn(shopping_cart)"><i class="el-icon-minus"></i></a>
                    </div>
                    <div class="center">
                      <input class="num" type="text" v-model="shopping_cart.num">
                    </div>
                    <div class="right">
                      <a class="add" @click="addBtn(shopping_cart)"><i class="el-icon-plus"></i></a>
                    </div>
                  </div>
                </el-col>
                <el-col span="4">
                  <span class="text">￥{{getSubtotal(shopping_cart.goods.shop_price, shopping_cart.num)}}元</span>
                </el-col>
                <el-col span="2">
                  <a class="text" href="javascript:" @click="delShoppingCart(shopping_cart.goods.id)">删除</a>
                </el-col>
              </el-row>
            </dd>
          </dl>
        </div>
        <el-row>
          <a class="empty-cart" href="javascript:" @click="delAllShoppingCart">清空购物车</a>
        </el-row>
        <el-row>
          <a class="continue-shopping" href="/#/home/index">继续购物</a>
        </el-row>
        <el-row>
          <el-col span="5" offset="19">
            {{getTotalNum}} 件商品，总价：<span class="sum-price">￥{{getTotalPrice}}元</span>
          </el-col>
        </el-row>
        <dl class="address-mod">
          <dt>配送地址</dt>
          <dd>
            <el-row>
              <el-col span="3">
                <el-button class="add-address-btn" type="success" size="mini" @click="centerDialogVisible = true">
                  新增地址
                </el-button>
              </el-col>
              <el-col span="21">
                <el-radio-group v-model="radio">
                  <el-radio :label="index" v-for="(address, index) in addresses" :key="index">
                    {{address.signer_name}} {{address.signer_mobile}}
                    {{address.province}}{{address.city}}{{address.district}}{{address.address}}
                  </el-radio>
                </el-radio-group>
              </el-col>
            </el-row>
          </dd>
        </dl>
        <dl class="pay-mod">
          <dt>选择支付方式</dt>
          <dd>
            <ul class="pay-list">
              <li class="active">
                <img src="./images/alipay.128a09b.jpg" alt="">
              </li>
            </ul>
          </dd>
        </dl>
        <dl class="message-mod">
          <dt>留言内容</dt>
          <dd>
            <el-input
                type="textarea"
                :rows="3"
                placeholder="请输入留言内容"
                v-model="post_script">
            </el-input>
          </dd>
        </dl>
        <el-row>
            <a class="send-btn" href="javascript:" @click="createOrder">去结算</a>
        </el-row>
      </div>
      <el-dialog
          title="提示"
          :visible.sync="centerDialogVisible"
          width="30%"
          center>
        <el-form label-width="80px">
          <el-form-item label="收货人">
            <el-input v-model="signer_name"></el-input>
          </el-form-item>
          <el-form-item label="手机号">
            <el-input type="tel" v-model="signer_mobile"></el-input>
          </el-form-item>
          <el-form-item label="地区">
            <el-cascader
                v-model="selectedOptions"
                :options="options"
                @change="handleChange"
            ></el-cascader>
          </el-form-item>
          <el-form-item label="详细地址">
            <el-input type="text" v-model="address"></el-input>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button @click="centerDialogVisible = false">取 消</el-button>
          <el-button type="primary" @click="addAddress">确 定</el-button>
        </span>
      </el-dialog>
    </main>
    <Footer></Footer>
  </div>
</template>

<script type="text/ecmascript-6">
  import Footer from 'components/Footer/Footer'
  import {mapState, mapGetters} from 'vuex'
	import options from 'common/js/country-data'

  export default {
    name: 'ShoppingCart',
    data () {
    	return {
    		num: 1,
				post_script: '',
				radio: 0,
				centerDialogVisible: false,
        signer_name: '',
        signer_mobile: '',
        address: '',
				selectedOptions: [],
				options: options,
      }
    },
    methods: {
			// 退出登录
			logout () {
				this.$store.dispatch('logout')
			},
      // 删除购物车
			delShoppingCart (goods_id) {
				this.$store.dispatch('delShoppingCart', goods_id)
      },
      // 清空购物车
			delAllShoppingCart () {
				this.$store.dispatch('delAllShoppingCart')
      },
      // 增加数量
      addBtn (shopping_cart) {
				if (shopping_cart.num < shopping_cart.goods.goods_num) {
					shopping_cart.num += 1
					this.$store.dispatch('updateShoppingCart', {'goods': shopping_cart.goods.id, 'num': shopping_cart.num})
        }
      },
      // 减少数量
			delBtn (shopping_cart) {
				if (shopping_cart.num > 1) {
					shopping_cart.num -= 1
					this.$store.dispatch('updateShoppingCart', {'goods': shopping_cart.goods.id, 'num': shopping_cart.num})
        }
      },
      // 去结算
			createOrder () {
				let address = this.addresses[this.radio]
				if (address) {
					this.$store.dispatch('addOrder', {
						'post_script': this.post_script,
						'order_mount': this.getTotalPrice,
						'address': address.province + address.city + address.district + address.address,
						'signer_name': address.signer_name,
						'signer_mobile': address.signer_mobile
					})
        } else {
				  this.$message.error('请添加收货地址')
        }
      },
      // 小计
			getSubtotal (price, num) {
				return price * num
      },
			// 增加地址
			addAddress () {
				this.centerDialogVisible = false
				this.$store.dispatch('addAddress', {
					'province': this.selectedOptions[0],
					'city': this.selectedOptions[1],
					'district': this.selectedOptions[2],
					'address': this.address,
					'signer_name': this.signer_name,
					'signer_mobile': this.signer_mobile
				})
			},
    },
    components: {
    	Footer,
    },
    computed: {
    	...mapState(['shopping_carts', 'addresses', 'user_token']),
      ...mapGetters(['getTotalPrice', 'getTotalNum']),
    },
    created () {
    	// 地址
    	this.$store.dispatch('getAddresses')
      // 购物车
      this.$store.dispatch('getShoppingCarts')
		}
	}
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  @import "~common/stylus/variable.styl"

  .header
    height 60px
    width 100%
    background-color $color-black
    .container
      width 1000px
      margin 0 auto
      .btn-list
        a
          display block
          float left
          width 140px
          height 60px
          line-height 60px
          color $color-white
          font-size $font-size-small-x
          text-align center
          &:hover
            background-color $color-black-ll
      .step-list
        height 40px
        line-height 40px
        margin-top 10px
        position relative
        li
          &:nth-child(1) ::after
            content ''
            width 0
            height 0
            position absolute
            left 45px
            bottom -10px
            border-bottom 10px solid $color-white-s
            border-left 10px solid $color-black
            border-right  10px solid $color-black
          &:nth-child(2) ::after
            content ''
            width 0
            height 0
            position absolute
            left 210px
            bottom -10px
            border-bottom 10px solid $color-white-s
            border-left 10px solid $color-black
            border-right  10px solid $color-black
          .num-icon
            display block
            float left
            width 25px
            height 30px
            margin-top 7px
            line-height 28px
            background url("./images/icons.png") 0 -30px no-repeat
            text-align center
            color $color-white
            font-size $font-size-medium
            font-weight 600
            &.off
              background url("./images/icons.png") 0 0 no-repeat
        .text
          display block
          float left
          color $color-black-m
          font-size $font-size-medium
        .arrow
          background-color sandybrown
          display block
          float left
          width 60px
          height 30px
          background url("./images/icons.png") 0 -130px no-repeat
          margin-left 5px
          margin-top -2px
  .main
    width 100%
    background-color $color-white-s
    padding-top 20px
    padding-bottom 50px
    .container
      width 1000px
      margin 0 auto
      .order-mod
        border 1px solid $color-white-4l
        background-color $color-white
        dt
          padding 20px
          border-bottom 1px solid $color-black-l
        dd
          padding 20px
        .goods-img
          width 62px
          height 62px
          border 1px solid $color-white-3l
          margin-bottom 10px
        .goods-name
          position relative
          top -30px
          left 20px
          font-size $font-size-medium
          color $color-black-4l
        .text
          color $color-black-4l
          line-height 65px
        .input-number
          width 140px
          height 25px
          border 1px solid $color-white-4l
          margin-top 20px
          .left
            float left
            .del
              display block
              width 25px
              height 24px
              line-height 24px
              text-align center
              background-color $color-white
              border-right 1px solid $color-white-4l
          .center
            height 100%
            float left
            .num
              height 100%
              width 56px
              padding-left 70%
              border none
          .right
            float right
            .add
              background-color $color-white
              border-left 1px solid $color-white-4l
              display block
              width 25px
              line-height 25px
              text-align center
              height 25px
      .empty-cart
        display block
        margin 20px 0
        width 60px
        &:hover
          color $color-theme
      .continue-shopping
        display block
        width 80px
        height 30px
        line-height 30px
        text-align center
        border 1px solid $color-white-4l
        border-radius 2px
        background-image linear-gradient($color-white-l, $color-black-s)
        margin-bottom 20px
        &:hover
          background-image linear-gradient($color-white-l, $color-black-m)
      .sum-price
        color $color-theme
        font-size $font-size-large
        font-weight 700
      .address-mod, .pay-mod, .message-mod
        margin-top 20px
        border 1px solid $color-white-4l
        dt
          width 100%
          height 35px
          background-color $color-white-4l
          padding 10px
          box-sizing border-box
          font-size $font-size-medium
          font-weight 700
        dd
          padding 20px 10px
          .add-address-btn
            margin-right 20px
            margin-bottom 10px
          .el-radio-group
            .el-radio
              margin 8px
          .pay-list
            li
              width 100px
              &.active
                border 1px solid $color-red
              img
                width 100px
                height 80px
      .send-btn
        margin-top 20px
        display block
        float right
        color $color-white
        background-color $color-theme
        border-radius 5px
        height 36px
        line-height 36px
        width 100px
        border 1px solid $color-theme-highlight
        text-align center
        font-size $font-size-medium
</style>























