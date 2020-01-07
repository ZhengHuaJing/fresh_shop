<template>
  <div class="main">
    <van-cell-group>
      <van-cell
          v-for="address in addresses"
          :title="`${address.signer_name} ${address.signer_mobile}`"
          :label="`${address.province}${address.city}${address.district}${address.address}`">
        <van-button class="delete-btn" slot="default" href="javascript:" size="mini" @click="delAddress(address.id)">
          删除
        </van-button>
      </van-cell>
    </van-cell-group>
    <van-button @click="addAddress" class="add-address" type="danger">新增地址</van-button>
  </div>
</template>

<script type="text/ecmascript-6">
  import { CellGroup, Button, Cell } from 'vant'
  import { mapState } from 'vuex'

  export default {
    name: 'UserAddress',
    data () {
    	return {
				chosenAddressId: '1',
      }
    },
    components: {
    	[CellGroup.name]: CellGroup,
      [Button.name]: Button,
      [Cell.name]: Cell
    },
    methods: {
    	// 添加地址
			addAddress () {
				this.$router.push('/user_address_add')
			},
      // 删除地址
			delAddress (id) {
				this.$store.dispatch('delAddress', id)
      }
    },
    computed: {
    	...mapState(['addresses'])
    },
    created () {
    	// 获取收货地址
      this.$store.dispatch('getAddresses')
		}
	}
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  @import "~common/stylus/variable.styl"

  .delete-btn
    position relative
    top 10px
    font-size $font-size-small-x
  .add-address
    position fixed
    bottom 0
    width 100%
</style>
