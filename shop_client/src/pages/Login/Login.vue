<template>
  <section class="login-mod">
    <dl>
      <dt>
        <span class="title">账号登录</span>
      </dt>
      <dd>
        <div class="login-input">
          <el-input placeholder="请输入邮箱" v-model="username">
            <template slot="prepend"><i class="el-icon-user"></i></template>
          </el-input>
          <el-input placeholder="请输入密码" v-model="password" show-password>
            <template slot="prepend"><i class="el-icon-lock"></i></template>
          </el-input>
          <a href="/#/user/email_login" class="forget-password" type="text">忘记密码</a>
        </div>
        <el-button type="success" @click="login">立即登录</el-button>
        <el-row class="help">没有账号？<a class="registered-text" href="/#/user/register">[立即注册]</a></el-row>
      </dd>
    </dl>
  </section>
</template>

<script type="text/ecmascript-6">
  export default {
    name: 'Login',
    data () {
    	return {
    		username: '',
        password: '',
      }
    },
    methods: {
    	// 用户登录
      login () {
      	if (this.username.trim().length < 0) {
      		this.$message.error('用户名不能为空')
        } else if (this.password.trim().length < 0) {
      		this.$message.error('密码不能为空')
        } else {
          this.$store.dispatch('login', {'username': this.username, 'password': this.password})
        }
      }
    }
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
        position relative
        .el-input
          margin-top 20px
        .forget-password
          position absolute
          right 0
          top 130px
          color $color-black-3l
      .el-button
        width 100%
      .third-party
        display block
        margin-top 30px
        padding-bottom 15px
        color $color-black-3l
        font-size $font-size-small-x
        font-weight 700
      .third-party-list
        height 30px
        margin-bottom 70px
        li
          float left
          margin-right 15px
          .login-qq
            display block
            height 30px
            width 30px
            background url("images/login-logo.png") -40px 0 no-repeat
          .login-weibo
            display block
            height 30px
            width 30px
            background url("images/login-logo.png") 0 0 no-repeat
          .login-weixin
            display block
            height 30px
            width 30px
            background url("images/login-logo.png") -200px 0 no-repeat
      .help
        position absolute
        bottom 20px
        .registered-text
          color $color-orange
</style>
