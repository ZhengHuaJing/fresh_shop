<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>

<script type="text/ecmascript-6">
  import { USER_TOKEN } from "store/mutation-types"
  import cookie from 'common/js/cookie'

	export default {
		name: 'app',
    created () {
			// 从 cookie 读取token
      this.$store.commit(USER_TOKEN, {'username': cookie.getCookie('username'), 'token': cookie.getCookie('token')})
		}
	}
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
</style>

