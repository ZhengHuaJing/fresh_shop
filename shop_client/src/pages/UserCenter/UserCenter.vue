<template>
  <main class="main">
    <div class="container">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>用户中心</el-breadcrumb-item>
      </el-breadcrumb>
      <div class="left">
        <el-menu
            default-active="2"
            class="el-menu-vertical-demo"
            @open="handleOpen"
            @close="handleClose">
          <el-submenu index="1">
            <template slot="title">
              <span>订单中心</span>
            </template>
            <el-menu-item index="1-1">
              <router-link to="/home/user_center/order">我的订单</router-link>
            </el-menu-item>
            <el-menu-item index="1-2">
              <router-link to="/home/user_center/address">收货地址</router-link>
            </el-menu-item>
          </el-submenu>
          <el-submenu index="2">
            <template slot="title">
              <span>用户中心</span>
            </template>
            <el-menu-item index="2-1">
              <router-link to="/home/user_center/user_info">用户信息</router-link>
            </el-menu-item>
            <el-menu-item index="2-2">
              <router-link to="/home/user_center/fav">我的收藏</router-link>
            </el-menu-item>
            <el-menu-item index="2-3">
              <router-link to="/home/user_center/message">我的留言</router-link>
            </el-menu-item>
          </el-submenu>
        </el-menu>
      </div>
      <div class="right">
        <router-view></router-view>
      </div>
    </div>
  </main>
</template>

<script type="text/ecmascript-6">
  export default {
    name: 'UserCenter',
  }
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  @import "~common/stylus/variable.styl"
  @import "~common/stylus/mixin.styl"

  .main
    width 100%
    height 1000px
    background-color $color-white-s
    .container
      width 1200px
      margin 0 auto
      breadcrumb()
      .left
        float left
        width 200px
      .right
        float right
        width 970px
</style>
