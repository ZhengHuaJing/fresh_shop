<template>
  <div>
    <el-card class="box-card">
      <div slot="header">
        <span>我的订单</span>
      </div>
      <el-table
          :data="getOrders"
          border
          style="width: 100%">
        <el-table-column
            label="订单号"
            align="center">
          <template slot-scope="scope">
            <a :href="`/#/home/user_center/order_detail/${scope.row.id}`" target="_blank">{{ scope.row.order_sn }}</a>
          </template>
        </el-table-column>
        <el-table-column
            prop="add_time"
            label="下单时间"
            align="center">
        </el-table-column>
        <el-table-column
            prop="order_mount"
            label="订单总金额"
            align="center">
        </el-table-column>
        <el-table-column
            prop="pay_status"
            label="订单状态"
            align="center">
        </el-table-column>
        <el-table-column
            align="center"
            label="操作">
          <template slot-scope="scope">
            <a href="javascript:" v-show="scope.row.pay_status !== '已支付'" @click="delOrder(scope.row.id)">取消订单</a>
            <a :href="`/#/home/user_center/order_detail/${scope.row.id}`"
               target="_blank"
               v-show="scope.row.pay_status === '已支付'">
              订单详情
            </a>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script type="text/ecmascript-6">
  import {mapGetters} from 'vuex'

	export default {
		name: 'Order',
		data () {
			return {
			}
		},
    methods: {
			// 取消订单
			delOrder (id) {
				this.$confirm('确定要取消订单吗？', '提示', {
					confirmButtonText: '确定',
					cancelButtonText: '取消',
					type: 'warning'
				}).then(() => {
					this.$store.dispatch('delOrder', id)
				})
      },
    },
    computed: {
			...mapGetters(['getOrders'])
    },
    created () {
			// 订单列表
      this.$store.dispatch('getOrders')
		}
	}
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  @import "~common/stylus/variable.styl"
  @import "~common/stylus/mixin.styl"
</style>
