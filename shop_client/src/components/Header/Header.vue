<template>
  <header class="header">
    <section class="top-bar">
      <div class="container">
        <div class="left">
          <div class="not-login" v-show="!this.$store.state.user_token.token">
            <a class="top-btn" href="/#/user/login">请登录</a>
            <span class="separator">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>
            <a class="top-btn" href="/#/user/register">免费注册</a>
          </div>
          <div class="login" v-show="this.$store.state.user_token.token">
            <a class="top-btn" href="/#/home/user_center/user_info">{{this.$store.state.user_token.username}}&nbsp;</a>
            [<a class="top-btn" @click="logout">退出</a>]
          </div>
        </div>
        <div class="right">
          <el-dropdown>
            <a class="dropdown-link" href="/#/home/user_center/user_info">
              会员中心<i class="el-icon-arrow-down el-icon--right"></i>
            </a>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item>
                <a href="/#/home/user_center/order">我的订单</a>
              </el-dropdown-item>
              <el-dropdown-item>
                <a href="/#/home/user_center/fav">我的收藏</a>
              </el-dropdown-item>
              <el-dropdown-item>
                <a href="/#/home/user_center/address">收货地址</a>
              </el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
        </div>
      </div>
    </section>
    <section class="middle-mod">
      <div class="container">
        <div class="left">
          <a href="/#/home/index"><img src="./images/index.jpg" alt=""></a>
        </div>
        <div class="center">
          <div class="search-mod">
            <div class="search-input">
              <input class="search-text" type="text" v-model="search">
              <a class="search-btn" href="/#/home/list" @click="searchGoods(search)">搜&nbsp;索</a>
            </div>
            <ul class="hot-search">
              <li>
                <span>热搜榜：</span>
              </li>
              <li v-for="hot_word in hot_words">
                <a href="/#/home/list" @click="searchGoods(hot_word.keywords)">{{hot_word.keywords}}</a>
              </li>
            </ul>
          </div>
        </div>
        <div class="right">
          <ul>
            <li>
              <a href="#">
                <h4>正品保障</h4>
                <p>100%正品低价</p>
              </a>
            </li>
            <li>
              <a href="#">
                <h4>30天退换货</h4>
                <p>购物有保障</p>
              </a>
            </li>
            <li>
              <a href="#">
                <h4>满99就包邮</h4>
                <p>闪电发货</p>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </section>
    <section class="bottom-nav">
      <div class="container">
        <div class="down-menu">
          <a class="menu-btn" href="/#/home/index">全部商品分类 <i class="el-icon-arrow-down el-icon--right"></i>
            <ul class="menu-list">
              <li v-for="(catagory, index) in categorys" :key="index">
                <a class="super-category-btn" href="/#/home/list" @click="selectTopCategoryIndex(index)">
                  {{catagory.name}}
                  <ul class="sub-category">
                    <li v-for="sub_cat2 in catagory.sub_cat">
                      <dl>
                        <dt>
                          <a class="sub-title" @click="selectCategory(sub_cat2.id)">{{sub_cat2.name}}</a>
                        </dt>
                        <dd>
                          <a
                              class="sub-content"
                              v-for="sub_cat3 in sub_cat2.sub_cat"
                              @click="selectCategory(sub_cat3.id)"
                          >{{sub_cat3.name}}</a>
                        </dd>
                      </dl>
                    </li>
                  </ul>
                </a>
              </li>
            </ul>
          </a>
        </div>
        <ul class="btn-list">
          <li>
            <a href="/#/home/index">首页</a>
          </li>
          <li v-for="(tab_category, index) in getTabCategorys" :key="index">
            <a href="/#/home/list" @click="selectTopCategoryIndex(index)">{{tab_category.name}}</a>
          </li>
        </ul>
        <a class="shopping-cart" href="javascript:">
          <i class="el-icon-shopping-cart-2"></i>
          <span class="num-icon">{{getTotalNum}}</span>
          <span class="cart-text">去购物车结算</span>
          <span class="arrow"></span>
          <div class="cart-mod">
            <el-row class="goods-row">
              <ul>
                <li v-for="shopping_cart in shopping_carts">
                  <el-row>
                    <el-col span="6">
                      <a :href="`/#/home/detail/${shopping_cart.goods.id}/`">
                        <img class="image" :src="shopping_cart.goods.goods_front_image" alt="">
                      </a>
                    </el-col>
                    <el-col span="18">
                      <el-row>
                        <a class="name" :href="`/#/home/detail/${shopping_cart.goods.id}/`">
                          {{shopping_cart.goods.name}}
                        </a>
                      </el-row>
                      <el-row>
                        <el-col span="10">
                          <span class="price">{{shopping_cart.goods.shop_price}}</span>
                          <span class="num"> x {{shopping_cart.num}}</span>
                        </el-col>
                        <el-col offset="10" span="4">
                          <a @click="delShoppingCart(shopping_cart.goods.id)"><i class="el-icon-close"></i></a>
                        </el-col>
                      </el-row>
                    </el-col>
                  </el-row>
                </li>
              </ul>
            </el-row>
            <el-row class="info-mod">
              共 <span class="sum-num">{{getTotalNum}}</span> 件商品哦~
            </el-row>
            <el-row class="info-mod">
              <el-col span="12">
                总价：<span class="sum-price">{{getTotalPrice}}</span>
              </el-col>
              <el-col span="9" offset="3">
                <a class="payment-btn" href="/#/shopping_cart">去结算</a>
              </el-col>
            </el-row>
          </div>
        </a>
      </div>
    </section>
  </header>
</template>

<script type="text/ecmascript-6">
  import {mapState, mapGetters} from 'vuex'
  import state from 'store/state'
  import {CATEGORY_INDEX, PAGING_PARAMS} from "store/mutation-types"

	export default {
    name: 'Header',
    data () {
    	return {
        search: '',
      }
    },
    methods: {
			// 退出登录
			logout () {
        this.$store.dispatch('logout')
			},
      // 一级分类的下标索引
			selectTopCategoryIndex (index) {
				this.$store.commit(CATEGORY_INDEX, index)
        // 分页商品
        this.$store.commit(PAGING_PARAMS, {'page': 1, 'top_category': this.categorys[index].id})
				this.$store.dispatch('getGoodses', state.paging_params)
      },
      // 二级或三级分类下的商品
      selectCategory (id) {
				this.$store.commit(PAGING_PARAMS, {'page': 1, 'category_id': id})
				this.$store.dispatch('getGoodses', state.paging_params)
      },
      // 搜索商品
      searchGoods (search) {
				this.$store.commit(PAGING_PARAMS, {'page': 1, 'search': search})
				this.$store.dispatch('getGoodses', state.paging_params)
      },
      // 删除购物车中的商品
			delShoppingCart (goods_id) {
        this.$store.dispatch('delShoppingCart', goods_id)
      }
    },
    computed: {
    	...mapState(['hot_words', 'categorys', 'shopping_carts']),
      ...mapGetters(['getTabCategorys', 'getTotalPrice', 'getTotalNum'])
    },
    created () {
      // 热搜词
      this.$store.dispatch('getHotWords')
      // 分类
			this.$store.dispatch('getCategorys', {'category_type': 1})

      if (state.user_token.token) {
				// 购物车
				this.$store.dispatch('getShoppingCarts')
      }

		}
	}
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  @import "~common/stylus/variable.styl"

  .header
    width 100%
    height 185px
    box-sizing border-box
    position relative
    .top-bar
      background-color $color-white-m
      border-bottom 1px solid $color-white-4l
      .container
        width 1200px
        height 35px
        margin 0 auto
        line-height 35px
        .top-btn:hover
          color $color-theme
        .left
          float left
          .separator
            color $color-black-s
        .right
          float right
          .dropdown-link
            font-size $font-size-small-x
            &:hover
              color $color-theme
    .middle-mod
      background-color $color-white
      .container
        width 1200px
        height 115px
        margin 0 auto
        padding-top 25px
        box-sizing border-box
        position relative
        .left
          float left
        .center
          float left
          width 462px
          position absolute
          left 50%
          top 35px
          transform translateX(-60%)
          .search-mod
            text-align left
            .search-input
              width 100%
              height 36px
              border 2px solid $color-theme
              position relative
              box-sizing border-box
              .search-text
                border none
                height 30px
                width 366px
                position absolute
                left 10px
              .search-btn
                background-color $color-theme
                width 80px
                height 32px
                position absolute
                right 0
                color $color-white
                font-size $font-size-medium-x
                line-height 32px
                text-align center
            .hot-search
              margin-top 10px
              color $color-black-l
              a:hover
                color $color-theme
              li
                float left
                margin-right 10px
                &:nth-child(1)
                  margin-right 0
        .right
          float right
          height 78px
          padding-top 15px
          box-sizing border-box
          ul
            background-color darkkhaki
            li
              height 38px
              float left
              display block
              margin-right 10px
              a
                display block
                background url("./images/icon.png") no-repeat
                padding-left 40px
                width 100%
                height 100%
                box-sizing border-box
                p
                  color $color-black-l
                  margin-top 8px
              &:nth-child(1) a
                background-position 0 0
              &:nth-child(2) a
                background-position 0 -50px
              &:nth-child(3) a
                background-position 0 -100px
    .bottom-nav
      background-color $color-theme
      .container
        width 1200px
        height 35px
        margin 0 auto
        position relative
        .down-menu
          background-color $color-black
          color $color-white
          width 214px
          height 100%
          float left
          .menu-btn
            width 100%
            height 100%
            display block
            color $color-white
            font-size $font-size-medium
            text-align center
            padding-top 10px
            font-weight 600
            box-sizing border-box
            &:hover .menu-list
              display block
            .menu-list
              width 214px
              padding 10px 0
              background-color $color-black-4l
              margin-top 10px
              position absolute
              left 0
              top 25px
              z-index 100
              display none
              .super-category-btn
                color $color-white
                display block
                width 100%
                height 36px
                line-height 36px
                padding-left -25px
                font-weight 400
                &:hover .sub-category
                  display block
                .sub-category
                  width 620px
                  background-color $color-white-3l
                  position absolute
                  left 214px
                  top 0
                  padding 20px
                  box-sizing border-box
                  z-index 100
                  display none
                  li
                    height 40px
                    dt
                      float left
                      width 80px
                      .sub-title
                        color $color-black-5l
                        font-weight 700
                        font-size $font-size-small-x
                    dd
                      float left
                      width 460px
                      text-align left
                      a
                        margin-right 15px
                        color $color-theme
                        font-size $font-size-small-x
                        &:hover
                          color $color-white
        .btn-list
          float left
          li
            float left
            a
              display block
              padding 10px 20px
              height 100%
              text-align center
              font-size $font-size-medium
              color $color-white
              &:hover
                background-color $color-theme-highlight
        .shopping-cart
          width 170px
          height 35px
          line-height 35px
          display block
          float right
          background-color $color-white-l
          padding-left 10px
          box-sizing border-box
          border 1px solid $color-theme-highlight
          &:hover .cart-mod
            display block
          .el-icon-shopping-cart-2
            font-size $font-size-large-x
          .num-icon
            position absolute
            top -5px
            right 127px
            width 18px
            height 18px
            line-height 16px
            border-radius 50%
            font-size $font-size-small
            text-align center
            background-color $color-theme
            border 2px solid $color-white
            color $color-white
            font-weight 600
          .cart-text
            font-size $font-size-medium
            margin-left 6px
            color $color-black-3l
          .arrow
            float right
            display block
            width 35px
            height 100%
            background-color $color-theme-highlight
            &:after
              content ''
              width 0
              height 0
              border-top 6px solid $color-white
              border-left 5px solid $color-theme-highlight
              border-right 5px solid $color-theme-highlight
              position relative
              top 9px
              left 40%
          .cart-mod
            display none
            float left
            width 220px
            background-color $color-white-m
            border 1px solid $color-theme
            position relative
            left -62px
            top -2px
            z-index 100
            .goods-row
              background-color $color-white
              padding 5px 10px
              line-height 20px
              border-bottom 1px dashed $color-white-3l
              .image
                width 40px
                height 40px
                border 1px solid $color-white-4l
              .price
                font-size $font-size-medium
                color $color-theme
            .info-mod
              padding 0 10px
              .payment-btn
                font-size $font-size-medium
                height 35px
                display block
                background-color $color-theme
                color $color-white
                text-align center
                margin-bottom 10px
              .sum-price, .sum-num
                font-size $font-size-medium
                color $color-theme

</style>
























