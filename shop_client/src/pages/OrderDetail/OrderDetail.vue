<template>
  <div>
    <el-card class="box-card">
      <div slot="header">
        <span>订单状态</span>
      </div>
      <div class="table">
        <el-row class="table-header">
          <el-col span="12" class="border-right">订单号</el-col>
          <el-col span="12">订单状态</el-col>
        </el-row>
        <el-row class="table-body">
          <el-col span="12" class="border-right">{{order.order_sn}}</el-col>
          <el-col span="12">
            {{order.pay_status}}
            <a class="alipay" :href="order.alipay_url" v-show="order.pay_status !== '已支付'">前往支付</a>
          </el-col>
        </el-row>
      </div>
    </el-card>
    <el-card class="box-card">
      <div slot="header">
        <span>商品列表</span>
      </div>
      <div class="table">
        <el-row class="table-header">
          <el-col span="12" class="border-right">商品名称</el-col>
          <el-col span="4" class="border-right">商品价格</el-col>
          <el-col span="4" class="border-right">购买数量</el-col>
          <el-col span="4">小计</el-col>
        </el-row>
        <el-row class="table-body" v-for="order_goods in order.goods">
          <el-col span="12" class="border-right">
            <a :href="`/#/home/detail/${order_goods.goods.id}`" target="_blank">{{order_goods.goods.name}}</a>
          </el-col>
          <el-col span="4" class="border-right">{{order_goods.goods.shop_price}}</el-col>
          <el-col span="4" class="border-right">{{order_goods.goods_num}}</el-col>
          <el-col span="4">{{getTotalPrice(order_goods.goods.shop_price, order_goods.goods_num)}}</el-col>
        </el-row>
      </div>
    </el-card>
    <el-card class="box-card">
      <div slot="header">
        <span>收货人信息</span>
      </div>
      <div class="table">
        <el-row class="table-header">
          <el-col span="3" class="border-right">收货人姓名</el-col>
          <el-col span="4" class="border-right">收货人电话</el-col>
          <el-col span="17">收货地址</el-col>
        </el-row>
        <el-row class="table-body">
          <el-col span="3" class="border-right">{{order.signer_name}}</el-col>
          <el-col span="4" class="border-right">{{order.signer_mobile}}</el-col>
          <el-col span="17" class="border-right">{{order.address}}</el-col>
        </el-row>
      </div>
    </el-card>
  </div>
</template>

<script type="text/ecmascript-6">
  import {mapState} from 'vuex'

  export default {
    name: 'OrderDetail',
    data () {
    	return {
      }
    },
    methods: {
    	// 计算小计
    	getTotalPrice (price, num) {
    		return price * num
      }
    },
    computed: {
    	...mapState(['order'])
    },
    created() {
    	// 获取订单详情
			this.$store.dispatch('getOrder', /\d+/.exec(this.$route.fullPath)[0])
		}
	}
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  @import "~common/stylus/variable.styl"

  .el-card
    margin-bottom 20px
    .table
      border 1px solid $color-white-4l
      .table-header
        height 40px
        line-height 40px
        text-align center
        background-color $color-white-ll
        .border-right
          border-right 1px solid $color-white-4l
      .table-body
        height 45px
        line-height 45px
        text-align center
        .border-right
          border-right 1px solid $color-white-4l
        .alipay
          color $color-theme
</style>
