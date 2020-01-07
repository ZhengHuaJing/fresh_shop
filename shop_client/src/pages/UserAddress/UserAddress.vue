<template>
  <div>
    <el-card class="box-card">
      <div slot="header">
        <span>地址列表</span>
      </div>
      <el-button class="margin-bottom-20" type="success" size="mini" @click="centerDialogVisible = true">
        新增地址
      </el-button>
      <el-table
          :data="addresses"
          border
          style="width: 100%">
        <el-table-column
            prop="signer_name"
            label="收货人">
        </el-table-column>
        <el-table-column
            prop="signer_mobile"
            label="手机">
        </el-table-column>
        <el-table-column
            prop="province"
            label="省份">
        </el-table-column>
        <el-table-column
            prop="city"
            label="城市">
        </el-table-column>
        <el-table-column
            prop="district"
            label="区域">
        </el-table-column>
        <el-table-column
            prop="address"
            label="详细地址">
        </el-table-column>
        <el-table-column
            prop="id"
            label="操作">
          <template slot-scope="scope">
            <el-button type="text" @click="delAddress(scope.row.id)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-dialog
          title="提示"
          :visible.sync="centerDialogVisible"
          width="30%"
          center>
        <el-form ref="form" :model="form" label-width="80px">
          <el-form-item label="收货人">
            <el-input v-model="form.signer_name"></el-input>
          </el-form-item>
          <el-form-item label="手机号">
            <el-input type="tel" v-model="form.signer_mobile"></el-input>
          </el-form-item>
          <el-form-item label="地区">
            <el-cascader
                v-model="selectedOptions"
                :options="options"
                @change="handleChange"
            ></el-cascader>
          </el-form-item>
          <el-form-item label="详细地址">
            <el-input type="text" v-model="form.address"></el-input>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button @click="centerDialogVisible = false">取 消</el-button>
          <el-button type="primary" @click="addAddress">确 定</el-button>
        </span>
      </el-dialog>
    </el-card>
  </div>
</template>

<script type="text/ecmascript-6">
  import {mapState} from 'vuex'
  import options from 'common/js/country-data'

  export default {
    name: 'UserAddress',
    data () {
    	return {
				centerDialogVisible: false,
				form: {
					signer_name: '',
					signer_mobile: '',
          address: ''
				},
				selectedOptions: [],
				options: options,
      }
    },
    methods: {
    	// 增加地址
			addAddress () {
				this.centerDialogVisible = false
        this.$store.dispatch('addAddress', {
					'province': this.selectedOptions[0],
					'city': this.selectedOptions[1],
					'district': this.selectedOptions[2],
					'address': this.form.address,
					'signer_name': this.form.signer_name,
					'signer_mobile': this.form.signer_mobile
				})
      },
      // 删除地址
      delAddress (id) {
				this.$confirm('确定要删除地址吗？', '提示', {
					confirmButtonText: '确定',
					cancelButtonText: '取消',
					type: 'warning'
				}).then(() => {
					this.$store.dispatch('delAddress', id)
				})
      }
    },
    computed: {
    	...mapState(['addresses'])
    },
    created() {
      // 地址列表
      this.$store.dispatch('getAddresses')
    }
	}
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  @import "~common/stylus/mixin.styl"

  .el-cascader
    width 100%
</style>





















