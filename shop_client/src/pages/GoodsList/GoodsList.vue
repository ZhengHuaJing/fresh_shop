<template>
  <main class="main">
    <div class="container">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>商品列表</el-breadcrumb-item>
      </el-breadcrumb>
      <div class="left">
        <el-row class="cate-head">
          <el-col span="12">
            <span class="title">{{getCategory.name}}</span>
          </el-col>
        </el-row>
        <el-row class="cate-content">
          <ul class="cate-list">
            <li v-for="sub_cat2 in getCategory.sub_cat">
              <dl>
                <dt>
                  <a href="javascript:" @click="selectCategory(sub_cat2.id)">{{sub_cat2.name}}</a>
                </dt>
                <dd v-for="sub_cat3 in sub_cat2.sub_cat">
                  <a href="javascript:" @click="selectCategory(sub_cat3.id)">{{sub_cat3.name}}</a>
                </dd>
              </dl>
            </li>
          </ul>
        </el-row>
      </div>
      <div class="right">
        <el-row class="filter-mod">
          <el-col span="1">
            <span class="filter-text">价格：</span>
          </el-col>
          <el-col span="10">
            <ul class="condition-list">
              <li>
                <a href="javascript:" @click="filter(1, 24)">1 - 24</a>
              </li>
              <li>
                <a href="javascript:" @click="filter(15, 20)">15 - 20</a>
              </li>
              <li>
                <a href="javascript:" @click="filter(40, 80)">40 - 80</a>
              </li>
              <li>
                <a href="javascript:" @click="filter(76, 100)">76 - 100</a>
              </li>
            </ul>
          </el-col>
          <el-col span="13">
            <div class="search-price">
              <el-input
                  size="mini"
                  placeholder="起始价格"
                  v-model="price_min">
                <i slot="prefix">￥</i>
              </el-input>
               -
              <el-input
                  size="mini"
                  placeholder="终止价格"
                  v-model="price_max">
                <i slot="prefix">￥</i>
              </el-input>
              <el-button size="mini" @click="filter(price_min, price_max)">搜索</el-button>
            </div>
          </el-col>
        </el-row>
        <el-row class="sort-mod">
          <el-col span="12">
            <a class="sort-text" href="javascript:" @click="ordering('-sold_num')">
              销量 <i class="el-icon-bottom"></i>
            </a>
            <a class="sort-text" href="javascript:" @click="ordering('-shop_price')">
              价格 <i class="el-icon-bottom"></i>
            </a>
          </el-col>
          <el-col span="2" offset="10">
            <span>共 <span class="num">{{goodses.count}}</span> 个商品</span>
          </el-col>
        </el-row>
        <el-row class="goods-list-mod margin-top-20">
          <ListGoodsItem
              v-for="goods in goodses.results"
              class="margin-right-20 margin-bottom-20"
              :id="goods.id"
              :img="goods.goods_front_image"
              :name="goods.name"
              :price="goods.shop_price"
              :sold_num="goods.sold_num"
          ></ListGoodsItem>
          <el-pagination
              @current-change="currentChangePage"
              background
              :pager-count="5"
              :page-size="12"
              layout="total, prev, pager, next, jumper"
              hide-on-single-page="false"
              :total="goodses.count">
          </el-pagination>
        </el-row>
      </div>
    </div>
  </main>
</template>

<script type="text/ecmascript-6">
	import ListGoodsItem from 'components/ListGoodsItem/ListGoodsItem'
  import { mapGetters, mapState } from 'vuex'
  import state from 'store/state'
  import { PAGING_PARAMS } from "store/mutation-types"

	export default {
    name: 'GoodsList',
    data () {
    	return {
    		price_min: 0,
        price_max: 0,
      }
    },
    methods: {
    	// 分页
			currentChangePage (page=1) {
				// 在分页条件中增加一个页数
				state.paging_params.page = page
				this.$store.commit(PAGING_PARAMS, state.paging_params)
				this.$store.dispatch('getGoodses', state.paging_params)
      },
      // 过滤
      filter (price_min, price_max) {
				if (price_max > price_min) {
					this.$store.commit(PAGING_PARAMS, {'price_min': price_min, 'price_max': price_max})
        } else {
					this.$message.error('请输入正确的价格区间')
        }
        this.currentChangePage()
      },
      // 排序
			ordering (ordering) {
				this.$store.commit(PAGING_PARAMS, {'ordering': ordering})
        this.currentChangePage()
      },
			// 二级或三级分类下的商品
			selectCategory (id) {
				this.$store.commit(PAGING_PARAMS, {'page': 1, 'category_id': id})
				this.$store.dispatch('getGoodses', state.paging_params)
			}
    },
    components: {
			ListGoodsItem,
    },
    computed: {
    	...mapGetters(['getCategory']),
      ...mapState(['goodses'])
    },
    created() {
    	this.$store.dispatch('getGoodses')
		}
	}
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  @import "~common/stylus/variable.styl"
  @import "~common/stylus/mixin.styl"

  .main
    width 100%
    background-color $color-white-s
    .container
      width 1200px
      margin 0 auto
      clearFloat()
      breadcrumb()
      .left
        float left
        width 215px
        border 1px solid $color-white-3l
        background-color $color-white
        .cate-head
          padding 20px 10px
          height 55px
          border-bottom 1px solid $color-white-3l
          background-color $color-white-l
          .title
            text-align center
            display block
            float left
            font-size $font-size-large
            color $color-black-4l
          .sub-title
            text-align center
            display block
            float right
            margin-top 8px
            font-size $font-size-small-x
            color $color-black-3l
        .cate-content
          padding-left 20px
          padding-bottom 20px
          dt
            font-size $font-size-medium
            color $color-black-3l
            margin-bottom 10px
            margin-top 20px
          dd
            line-height 30px
            margin-left 15px
      .right
        float right
        width 970px
        .filter-mod
          height 70px
          background-color $color-white
          border 1px solid $color-white-3l
          padding 25px 20px
          box-sizing border-box
          .filter-text
            font-size $font-size-small-x
            color $color-black-4l
          .condition-list
            li
              width 80px
              float left
              text-align center
              a
                color $color-black-3l
                &:hover
                  color $color-theme
          .search-price
            margin-top -8px
            color $color-black-3l
            .el-input
              width 120px
              i
                line-height 27px
            .el-button
              background-color $color-theme
              color $color-white
              margin-left 10px
        .sort-mod
          margin-top 10px
          height 40px
          background-color $color-white
          padding 15px
          .sort-text
            font-size $font-size-small-x
            margin-right 10px
            color $color-black-4l
            font-weight 500
            &:hover, &:hover i
              color $color-theme
            i
              color $color-red
              font-size $font-size-medium
          .num
            color $color-theme
            font-weight 600
        .goods-list-mod
          padding-bottom 100px
          .goods-item:nth-child(4n)
            margin-right 0
          .el-pagination
            position absolute
            bottom 0
            left 50%
            transform translateX(-50%)
</style>















