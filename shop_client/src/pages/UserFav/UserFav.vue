<template>
  <div>
    <el-card class="box-card">
      <div slot="header">
        <span>我的收藏</span>
      </div>
      <el-table
          :data="favs"
          border
          style="width: 100%">
        <el-table-column
            label="商品名称">
          <template slot-scope="scope">
            <a :href="`/#/home/detail/${scope.row.goods.id}`" target="_blank">{{ scope.row.goods.name }}</a>
          </template>
        </el-table-column>
        <el-table-column
            prop="goods.shop_price"
            label="价格">
        </el-table-column>
        <el-table-column
            label="操作">
          <template slot-scope="scope">
            <a type="text" @click="delFav(scope.row.goods.id)">删除</a>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script type="text/ecmascript-6">
  import {mapState} from 'vuex'

  export default {
    name: 'UserFav',
    data () {
    	return {
      }
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
    created() {
      // 获取收藏列表
      this.$store.dispatch('getFavs')
		}
	}
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">

</style>
