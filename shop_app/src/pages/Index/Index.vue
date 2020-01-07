<template>
  <div>
    <van-search
        v-model="search"
        placeholder="请输入搜索关键词"
        show-action
        shape="round">
      <div slot="action" @click="searchGoods">搜索</div>
    </van-search>
    <van-swipe :autoplay="2000" indicator-color="white">
      <van-swipe-item>
        <img class="banner-img" src="./images/banner1_SSyqG4g.jpg" alt="">
      </van-swipe-item>
      <van-swipe-item>
        <img class="banner-img" src="./images/banner2_zrA5lCU.jpg" alt="">
      </van-swipe-item>
      <van-swipe-item>
        <img class="banner-img" src="./images/banner3_zqQZJpZ.jpg" alt="">
      </van-swipe-item>
    </van-swipe>
    <van-grid :column-num="4" :border="false" icon-size="45px">
      <van-grid-item
          v-for="category in category_list"
          :icon="category.img"
          :text="category.name"
          @click="selectTopCategoryIndex(category.id)"
      >
      </van-grid-item>
    </van-grid>
    <section class="recommend-mod">
      <van-row>
        <van-col span="7">
          <img class="recommend-img" src="./images/xinpin.jpg" alt="">
        </van-col>
        <van-col span="17">
          <van-row>
            <van-col span="9" offset="1">
              <span class="head-text">刚出炉新品</span>
            </van-col>
            <van-col span="6" offset="8">
              <a class="head-text" href="/#/goods">更多>></a>
            </van-col>
          </van-row>
          <van-row class="recommend-list" v-for="goods in new_goodses">
            <van-col span="8">
              <img :src="goods.goods_front_image" alt="">
            </van-col>
            <van-col span="14" offset="2">
              <van-row>
                <a class="goods-name van-ellipsis" :href="`/#/goods/${goods.id}`">{{goods.name}}</a>
              </van-row>
              <van-row>
                <span class="reason">[推荐理由] </span>
                <div class="reason-content van-ellipsis">{{goods.goods_brief}}</div>
              </van-row>
              <van-row>
                <span class="price">￥{{goods.shop_price}}元</span>
                <del class="original-price">原价:￥{{goods.market_price}}元</del>
              </van-row>
            </van-col>
          </van-row>
        </van-col>
      </van-row>
    </section>
    <section class="category-mod" v-for="index_category in index_categorys">
      <van-row>
        <van-col span="7">
          <van-row>
            <span class="category-name">{{index_category.name}}</span>
          </van-row>
          <van-row>
            <ul class="brand-list">
              <li v-for="brand in index_category.brand">
                <img class="brand-logo" :src="brand.image" alt="">
              </li>
            </ul>
          </van-row>
          <van-row>
            <ul class="type-list">
              <li v-for="sub_cat in index_category.sub_cat.slice(0, 6)">
                <a href="javascript:" @click="selectCategory(sub_cat.id)">{{sub_cat.name}}</a>
              </li>
            </ul>
          </van-row>
        </van-col>
        <van-col span="17">
          <IndexGoodsItem
              v-for="goods in index_category.goods.slice(0, 4)"
              :id="goods.id"
              :img="goods.goods_front_image"
              :name="goods.name"
              :price="goods.shop_price"
          ></IndexGoodsItem>
        </van-col>
      </van-row>
    </section>
  </div>
</template>

<script type="text/ecmascript-6">
  import { Search, Swipe, SwipeItem, Grid, GridItem, Row, Col } from 'vant'
  import IndexGoodsItem from 'components/IndexGoodsItem/IndexGoodsItem'
  import { mapState } from 'vuex'
	import { CATEGORY_INDEX, PAGING_PARAMS } from "store/mutation-types"
  import state from 'store/state'

  export default {
    name: 'Index',
    data () {
    	return {
    		img: require('./images/goods.jpg'),
        category_list: [
          {
          	id: '74',
          	name: '休闲食品',
            img: require('./images/休闲食品.jpg')
          },
					{
						id: '108',
						name: '天然干货',
						img: require('./images/天然干货.jpg')
					},
					{
						id: '102',
						name: '奶类食品',
						img: require('./images/奶类食品.jpg')
					},
					{
						id: '1',
						name: '生鲜食品',
						img: require('./images/生鲜食品.png')
					},
          {
						id: '40',
						name: '粮油副食',
						img: require('./images/粮油副食.jpg')
					},
          {
						id: '57',
						name: '蔬菜水果',
						img: require('./images/蔬菜水果.png')
					},
					{
						id: '24',
						name: '酒水饮料',
						img: require('./images/酒水饮料.jpg')
					},
					{
						id: '117',
						name: '精选茗茶',
						img: require('./images/精选茗茶.jpg')
					},
        ],
        search: '',
      }
    },
    components: {
    	[Search.name]: Search,
      [Swipe.name]: Swipe,
      [SwipeItem.name]: SwipeItem,
      [Grid.name]: Grid,
      [GridItem.name]: GridItem,
      [Row.name]: Row,
      [Col.name]: Col,
			IndexGoodsItem
    },
    methods: {
			// 搜索商品
			searchGoods () {
				this.$store.commit(PAGING_PARAMS, {'page': 1, 'search': this.search})
				this.$store.dispatch('getGoodses', state.paging_params)
				this.$router.push('/goods')
			},
			// 一级分类的下标索引
			selectTopCategoryIndex (id) {
				this.$store.commit(PAGING_PARAMS, {'page': 1, 'top_category': id})
				this.$store.dispatch('getGoodses', state.paging_params)
        this.$router.push('/goods')
			},
			// 二级或三级分类下的商品
			selectCategory (id) {
				this.$store.commit(PAGING_PARAMS, {'page': 1, 'category_id': id})
				this.$store.dispatch('getGoodses', state.paging_params)
				this.$router.push('/goods')
			},
    },
    computed: {
    	...mapState(['index_categorys', 'new_goodses'])
    },
    created () {
			// 新品推荐
			this.$store.dispatch('getGoodses', {'is_new': 'True'})
			// 大类
			this.$store.dispatch('getIndexCategorys')
		}
	}
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  @import "~common/stylus/variable.styl"

  .van-swipe
    .banner-img
      width 100%
      height 150px
  .recommend-mod
    width 100%
    margin-top 10px
    padding 10px
    box-sizing border-box
    background-color $color-white
    .recommend-img
      width 100%
      height 220px
    .head-text
      font-size $font-size-small-x
      color $color-black-4l
    .recommend-list
      margin-top 5px
      padding 10px 14px
      border-bottom 1px solid $color-black-s
      &:nth-child(3)
        border none
      img
        width 80px
        height 80px
      .goods-name
        display block
        font-size $font-size-small-x
        color $color-black-5l
        width 120px
      .reason
        color $color-black-5l
        font-size $font-size-small
      .reason-content
        margin-top 3px
        margin-bottom 5px
        font-size $font-size-small
      .price
        font-size $font-size-small-x
        color $color-red
      .original-price
        margin-left 5px
        font-size $font-size-small
        color $color-red

  .category-mod
    margin-top 10px
    padding 10px
    height 220px
    width 100%
    background-color $color-white
    .category-name
      display block
      height 50px
      line-height 50px
      background-color $color-theme
      color $color-white
      text-align center
      font-size $font-size-medium
    .brand-list
      margin-top 20px
      box-sizing border-box
      li
        text-align center
        .brand-logo
          width 30px
          height 20px
          margin 0 auto
    .type-list
      margin-top 10px
      font-size $font-size-small
      li
        height 25px
        width 50%
        float left
        text-align center
        a
          color $color-black-3l
</style>
