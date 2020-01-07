<template>
  <div>
    <img class="user-poster" src="./images/bc.jpg">
    <img class="logo" src="./images/logo.gif" alt="">
    <van-row class="user-links">
      <van-col span="8">
        <span class="num">{{favs.length}}</span>
        收藏数
      </van-col>
      <van-col span="8">
        <span class="num">{{getTotalPay}}</span>
        累计交易
      </van-col>
      <van-col span="8">
        <span class="num">{{getPayMoney}}</span>
        累计消费
      </van-col>
    </van-row>
    <van-cell-group>
      <van-cell to="/user_info" icon="user-o" title="个人信息" is-link></van-cell>
      <van-cell to="/user_address"  icon="location-o" title="收货地址" is-link></van-cell>
      <van-cell to="/user_fav"  icon="star-o" title="收藏列表" is-link></van-cell>
      <van-cell to="/user_message"  icon="chat-o" title="我的留言" is-link></van-cell>
      <van-cell class="login-out" @click="logout"  icon="close" title="退出登录" is-link></van-cell>
    </van-cell-group>
  </div>
</template>

<script type="text/ecmascript-6">
  import { Row, Col, CellGroup, Cell } from 'vant'
  import { mapGetters, mapState } from 'vuex'

  export default {
    name: 'UserCenter',
    data () {
    	return {
    		fav_num: 0,
      }
    },
    components: {
    	[Row.name]: Row,
      [Col.name]: Col,
      [CellGroup.name]: CellGroup,
      [Cell.name]: Cell
    },
    methods: {
    	// 退出登录
    	logout () {
				this.$store.dispatch('logout')
      }
    },
    computed: {
    	...mapGetters(['getTotalPay', 'getPayMoney']),
      ...mapState(['favs'])
    },
    created () {
      // 获取所有订单商品（累计交易数）
      this.$store.dispatch('getOrders')
      // 收藏列表
      this.$store.dispatch('getFavs')

		}
	}
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  @import "~common/stylus/variable.styl"

  .user-poster
    width 100%
    height 53vw
    display block
  .logo
    position absolute
    top 68px
    left 50%
    transform translateX(-50%)
    height 35px
    width 145px
  .user-group
    margin-bottom 15px
  .user-links
    padding 15px 0
    font-size 12px
    text-align center
    background-color #fff
    .num
      display block
      margin-bottom 5px
      font-size $font-size-medium-x
      color $color-theme
  .login-out
    margin-top 10px
</style>
