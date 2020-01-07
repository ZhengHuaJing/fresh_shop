<template>
  <div id="app">
    <header class="header" v-show="this.$route.meta.is_header">
      <van-nav-bar
          :title="this.$route.meta.title"
          left-text="返回"
          left-arrow
          @click-left="back()">
        <van-icon @click="toHome" name="home-o" slot="right"/>
      </van-nav-bar>
    </header>
    <main class="main">
      <router-view></router-view>
    </main>
    <footer v-show="this.$route.meta.is_footer">
      <van-tabbar>
        <van-tabbar-item
            :class="{'van-tabbar-item--active': this.$route.path === '/index'}"
            to="/index"
            name="index"
            icon="home-o"
        >首页</van-tabbar-item>
        <van-tabbar-item
            :class="{'van-tabbar-item--active': this.$route.path === '/shopping_cart'}"
            to="/shopping_cart"
            name="shopping_cart"
            icon="shopping-cart-o"
            :info="getTotalNum"
        >购物车</van-tabbar-item>
        <van-tabbar-item
            :class="{'van-tabbar-item--active': this.$route.path === '/order'}"
            to="/order"
            name="order"
            icon="orders-o"
        >订单列表</van-tabbar-item>
        <van-tabbar-item
            :class="{'van-tabbar-item--active': this.$route.path === '/user_center'}"
            to="/user_center"
            name="user_center"
            icon="user-o"
        >我的</van-tabbar-item>
      </van-tabbar>
    </footer>
  </div>
</template>

<script>
  import { NavBar, Icon, Tabbar, TabbarItem } from 'vant'
  import { mapGetters } from 'vuex'
  import { USER_TOKEN } from 'store/mutation-types'
	import cookie from 'common/js/cookie'

  export default {
    name: 'app',
    components: {
    	[NavBar.name]: NavBar,
      [Icon.name]: Icon,
      [Tabbar.name]: Tabbar,
      [TabbarItem.name]: TabbarItem,
    },
		methods: {
			back () {
				this.$router.back()
			},
			toHome () {
				this.$router.push('/index')
      }
		},
    computed: {
    	...mapGetters(['getTotalNum'])
    },
    created() {
			// 从 cookie 读取token
			this.$store.commit(USER_TOKEN, {'username': cookie.getCookie('username'), 'token': cookie.getCookie('token')})
		}
	}
</script>

<style  scoped lang="stylus" rel="stylesheet/stylus">
  @import "~common/stylus/variable.styl"

  .main
    background-color $color-white-m
    margin-bottom 50px
</style>
