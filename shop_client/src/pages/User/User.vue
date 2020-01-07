<template>
  <div>
    <header class="header">
      <div class="container">
        <a class="btn" href="/#/home/index">网站首页</a>
      </div>
    </header>
    <main class="main">
      <router-view></router-view>
    </main>
    <Footer></Footer>
  </div>
</template>

<script type="text/ecmascript-6">
  import Footer from 'components/Footer/Footer'

  export default {
    name: 'User',
    components: {
    	Footer
    }
  }
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  @import "~common/stylus/variable.styl"
  @import "~common/stylus/mixin.styl"

  .header
    height 55px
    width 100%
    background-color $color-black
    .container
      width 1200px
      height 100%
      margin 0 auto
      .btn
        display block
        text-align center
        color $color-white
        height 100%
        line-height 50px
        width 80px
        &:hover
          background-color $color-black-3l
  .main
    height 500px
    background url("./images/bc.jpg") 40px no-repeat
</style>
























