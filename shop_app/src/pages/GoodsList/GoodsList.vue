<template>
  <div>
    <form action="/">
      <van-search
          v-model="search"
          placeholder="请输入搜索关键词"
          show-action>
        <div slot="action" @click="searchGoods">搜索</div>
      </van-search>
    </form>
    <van-dropdown-menu>
      <van-dropdown-item @close="filterGoods" v-model="value1" :options="option1" ></van-dropdown-item>
      <van-dropdown-item @close="filterGoods" v-model="value2" :options="option2" ></van-dropdown-item>
    </van-dropdown-menu>
    <van-card
        v-for="goods in goodses.results"
        :price="goods.shop_price"
        :desc="goods.goods_brief"
        :title="goods.name"
        :thumb="goods.goods_front_image"
        @click="goodsDetail(goods.id)"
    ></van-card>
  </div>
</template>

<script type="text/ecmascript-6">
  import { Search, DropdownMenu, DropdownItem, Card } from 'vant'
  import { mapState } from 'vuex'
	import { PAGING_PARAMS } from "store/mutation-types"
  import state from 'store/state'

	export default {
    name: 'GoodsList',
    data () {
			return {
				search: '',
				value: '',
				value1: 'default',
				value2: 'default',
				option1: [
					{ text: '全部商品', value: 'default' },
					{ text: '新款商品', value: 'is_new' },
					{ text: '热卖商品', value: 'is_hot' }
				],
				option2: [
					{ text: '默认排序', value: 'default' },
					{ text: '价格排序', value: 'shop_price' },
					{ text: '销量排序', value: 'sold_num' },
				]
      }
    },
    components: {
    	[Search.name]: Search,
      [DropdownMenu.name]: DropdownMenu,
      [DropdownItem.name]: DropdownItem,
      [Card.name]: Card
    },
    methods: {
			// 搜索商品
			searchGoods () {
				this.$store.commit(PAGING_PARAMS, {'page': 1, 'search': this.search})
				this.$store.dispatch('getGoodses', state.paging_params)
			},
      // 过滤商品
      filterGoods () {
				// 过滤
				if (this.value1 !== 'default') {
          if (this.value1 === 'is_new') {
						this.$store.commit(PAGING_PARAMS, {'is_new': 'True'})
          } else {
						this.$store.commit(PAGING_PARAMS, {'is_hot': 'True'})
          }
        } else if (this.value2 !== 'default') {
					this.$store.commit(PAGING_PARAMS, {'ordering': this.value2})
        } else {
					this.$store.commit(PAGING_PARAMS, {'page':1})
        }

				this.$store.dispatch('getGoodses', state.paging_params)
      },
      // 跳转商品详情页
			goodsDetail (goods_id) {
				this.$router.push('/goods/' + goods_id)
      }
    },
    computed: {
			...mapState(['goodses', 'categorys'])
    },
    created() {
			this.$store.dispatch('getGoodses', state.paging_params)
		}
	}
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">

</style>
