<template>
  <div>
    <van-cell-group>
      <van-field
          v-model="username"
          required
          clearable
          label="用户名"
          placeholder="请输入邮箱">
      </van-field>
      <van-field
          v-model="password"
          type="password"
          label="密码"
          placeholder="请输入密码"
          required>
      </van-field>
      <a class="forget-password" href="/#/email_login">忘记密码</a>
      <a class="register" href="/#/register">没有账号？注册一个</a>
      <van-button class="login-btn" @click="login" type="primary">立即登录</van-button>
    </van-cell-group>
  </div>
</template>

<script type="text/ecmascript-6">
	import { CellGroup, Field, Button } from 'vant'

  export default {
    name: 'Login',
    data () {
    	return {
    		username: '',
        password: ''
      }
    },
    components: {
    	[CellGroup.name]: CellGroup,
      [Field.name]: Field,
      [Button.name]: Button
    },
		methods: {
			// 用户登录
			login () {
				if (this.username.trim().length < 0) {
					this.$toast.fail('用户名不能为空')
				} else if (this.password.trim().length < 0) {
					this.$toast.fail('密码不能为空')
				} else {
					this.$store.dispatch('login', {'username': this.username, 'password': this.password})
				}
			}
		}
  }
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  .login-btn
    width 100%
    margin-top 80px
  .forget-password
    position absolute
    right 10px
    top 100px
  .register
    position absolute
    right 10px
    top 130px
</style>
