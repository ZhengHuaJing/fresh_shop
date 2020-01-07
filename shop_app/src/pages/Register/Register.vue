<template>
  <van-cell-group>
    <van-field
        v-model="username"
        required
        clearable
        label="用户名"
        placeholder="请输入邮箱">
    </van-field>
    <van-field
        v-model="code"
        center
        required
        clearable
        label="邮箱验证码"
        placeholder="请输入邮箱验证码">
      <van-button slot="button" @click="sendCode" size="small" type="primary" v-if="!show">发送验证码</van-button>
      <van-button slot="button" @click="sendCode" size="small" type="primary" v-if="show">
        {{count}} s 后重新获取
      </van-button>
    </van-field>
    <van-field
        v-model="password"
        type="password"
        label="密码"
        placeholder="请输入密码"
        required>
    </van-field>
    <van-button class="login-btn" @click="register" type="primary">注册并登录</van-button>
  </van-cell-group>
</template>

<script type="text/ecmascript-6">
  import { CellGroup, Field, Button } from 'vant'

  export default {
    name: 'Register',
		data () {
			return {
				username: '',
				password: '',
				code: '',
				show: false,
				count: '',
				timer: null,
			}
		},
    components: {
    	[CellGroup.name]: CellGroup,
      [Field.name]: Field,
      [Button.name]: Button
    },
		methods: {
			// 倒计时
			startCountDown(){
				const TIME_COUNT = 60;
				if (!this.timer) {
					this.count = TIME_COUNT;
					this.show = true;
					this.timer = setInterval(() => {
						if (this.count > 0 && this.count <= TIME_COUNT) {
							this.count--;
						} else {
							this.show = false;
							clearInterval(this.timer);
							this.timer = null;
						}
					}, 1000)
				}
			},
			// 发送短信验证码
			sendCode () {
				var reg_email = /^\w{3,}@\w{2,}\.(com|cn|net|com\.cn)$/

				if (reg_email.test(this.username.trim()) && !this.show) {
					this.$store.dispatch('sendEmailCode', this.username)
					// 启动计时器
					this.startCountDown()
				} else {
					this.$toast.fail('邮箱格式错误')
				}
			},
			// 注册
			register () {
				var reg_email = /^\w{3,}@\w{2,}\.(com|cn|net|com\.cn)$/
				var reg_code = /^\d{4}$/

				if (!reg_email.test(this.username.trim())) {
					this.$toast.fail('手机号格式错误')
				} else if (!reg_code.test(this.code.trim())) {
					this.$toast.fail('验证码格式错误')
				} else if (this.password.trim().length < 8) {
					this.$toast.fail('密码不能小于8位')
				} else {
					this.$store.dispatch('register', {'username': this.username, 'code': this.code, 'password': this.password})
				}

			}
		}
  }
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  .login-btn
    width 100%
    margin-top 50px
</style>
