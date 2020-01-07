<template>
  <div>
    <van-card
        v-for="(goods, index) in favs"
        :key="index"
        :desc="goods.goods.goods_brief"
        :title="goods.goods.name"
        :thumb="goods.goods.goods_front_image">
      <div slot="footer">
        <van-button @click="delFav(goods.goods.id)" size="mini">删除</van-button>
      </div>
    </van-card>
  </div>
</template>

<script type="text/ecmascript-6">
  import { Card, Button } from 'vant'
	import { mapState } from 'vuex'

  export default {
    name: 'UserFav',
    data () {
    	return {
      }
    },
    components: {
    	[Card.name]: Card,
      [Button.name]: Button
    },
		methods: {
			// 删除收藏
			delFav (goods_id) {
				this.$store.dispatch('delFav', goods_id)
			}
		},
		computed: {
			...mapState(['favs'])
		},
    created () {
			// 获取收藏列表
			this.$store.dispatch('getFavs')
		}
	}
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">

</style>
