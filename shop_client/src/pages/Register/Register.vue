<template>
  <section class="login-mod">
    <dl>
      <dt>
        <span class="title">账号注册</span>
      </dt>
      <dd>
        <div class="login-input">
          <el-input placeholder="请输入邮箱" v-model="username">
            <template slot="prepend"><i class="el-icon-user"></i></template>
          </el-input>
          <el-input class="code-input" placeholder="验证码" v-model="code">
            <template slot="prepend"><i class="el-icon-message"></i></template>
          </el-input>
          <el-button class="code-btn" @click="sendCode" disabled v-show="show">
            <span class="time-text">{{count}} s 后重新获取</span>
          </el-button>
          <el-button class="code-btn" @click="sendCode" v-show="!show">获取验证码</el-button>
          <el-input placeholder="请输入密码" show-password v-model="password">
            <template slot="prepend"><i class="el-icon-lock"></i></template>
          </el-input>
        </div>
        <el-button type="success" @click="register">注册并登录</el-button>
        <el-row class="help">已有账号？<a class="registered-text" href="/#/user/login">[立即登录]</a></el-row>
      </dd>
    </dl>
  </section>
</template>

<script type="text/ecmascript-6">
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
					this.$message.error('邮箱格式错误')
				}
			},
      // 注册
			register () {
				var reg_email = /^\w{3,}@\w{2,}\.(com|cn|net|com\.cn)$/
        var reg_code = /^\d{4}$/

				if (!reg_email.test(this.username.trim())) {
					this.$message.error('手机号格式错误')
        } else if (!reg_code.test(this.code.trim())) {
					this.$message.error('验证码格式错误')
        } else if (this.password.trim().length < 8) {
					this.$message.error('密码不能小于8位')
        } else {
					this.$store.dispatch('register', {'username': this.username, 'code': this.code, 'password': this.password})
        }

      }
    },
	}
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  @import "~common/stylus/variable.styl"
  @import "~common/stylus/mixin.styl"

  .login-mod
    padding 20px 40px
    height 470px
    width 370px
    background-color $color-white
    position absolute
    top 70px
    right 400px
    box-sizing border-box
    dt
      height 30px
      width 100%
      border-bottom 1px solid $color-white-3l
      .title
        font-size $font-size-medium-x
        color $color-black-4l
    dd
      height 400px
      .login-input
        margin-top 30px
        margin-bottom 50px
        .el-input
          margin-top 20px
        .code-input
          width 55%
        .code-btn
          margin-left 14px
          width 40%
          position relative
          top 2px
          .time-text
            margin-left -10px
      .el-button
        width 100%
      .help
        position absolute
        bottom 20px
        .registered-text
          color $color-orange
</style>
