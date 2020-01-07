<template>
  <div>
    <van-address-edit
        :area-list="area"
        area-columns-placeholder="请选择"
        show-postal
        show-search-result
        @save="addUserAddress"
    ></van-address-edit>
  </div>
</template>

<script type="text/ecmascript-6">
  import { AddressEdit } from 'vant'
  import area from 'common/js/area'

  export default {
    name: 'UserAddressAdd',
		data() {
			return {
				area: area
			}
		},
    components: {
    	[AddressEdit.name]: AddressEdit
    },
		methods: {
			// 增加地址
			addUserAddress (content) {
				this.$store.dispatch('addAddress', {
					'province': content.province,
					'city': content.city,
					'district': content.county,
					'address': content.addressDetail,
					'signer_name': content.name,
					'signer_mobile': content.tel
				})
        this.$router.back()
			}
		},
  }
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  @import "~common/stylus/variable.styl"

  .van-address-edit
    background-color $color-white
</style>
