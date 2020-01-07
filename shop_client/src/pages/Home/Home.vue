<template>
  <div>
    <Header></Header>
    <router-view></router-view>
    <Footer></Footer>
  </div>
</template>

<script type="text/ecmascript-6">
  import Header from 'components/Header/Header'
  import Footer from 'components/Footer/Footer'

  export default {
    name: 'Home',
    components: {
			Header,
			Footer
    }
	}
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">

</style>
