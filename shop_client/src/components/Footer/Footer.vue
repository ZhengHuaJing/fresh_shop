<template>
  <footer class="footer">
    <section class="image-list">
      <div class="container">
        <img class="image" src="./images/footer-1.gif" alt="">
        <img class="image" src="./images/footer-2.gif" alt="">
        <img class="image" src="./images/footer-3.gif" alt="">
        <img class="image" src="./images/footer-4.gif" alt="">
      </div>
    </section>
    <section class="bottom-bar">
      <el-row>
        <el-col span="3" offset="9">
          <span class="time-text">服务时间：09:00-23:00</span>
        </el-col>
        <el-col span="6">
          <span class="service-text">客服热线:</span>
          <span class="tel-num">010-88888888</span>
        </el-col>
      </el-row>
    </section>
  </footer>
</template>

<script type="text/ecmascript-6">
  export default {
    name: 'Footer',
  }
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  @import "~common/stylus/variable.styl"

  .footer
    width 100%
    .image-list
      width 100%
      height 90px
      background-color $color-theme
      .container
        width 1200px
        height 100%
        margin 0 auto
        li
          float left
          .image
            width 300px
            height 100%
    .bottom-bar
      height 60px
      line-height 60px
      .time-text
        color $color-black-3l
        font-size $font-size-small-x
      .service-text
        color $color-black-3l
        font-size $font-size-medium
      .tel-num
        color $color-theme
        font-size $font-size-large-x
        font-weight 700
</style>
