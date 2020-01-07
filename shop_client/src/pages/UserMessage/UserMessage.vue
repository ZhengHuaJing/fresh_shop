<template>
  <div>
    <el-card class="box-card">
      <div slot="header">
        <span></span>
      </div>
      <el-form ref="form" :model="form" label-width="80px">
        <el-form-item label="留言类型">
          <el-radio v-model="form.message_type" label="1">留言</el-radio>
          <el-radio v-model="form.message_type" label="2">投诉</el-radio>
          <el-radio v-model="form.message_type" label="3">咨询</el-radio>
          <el-radio v-model="form.message_type" label="4">售后</el-radio>
          <el-radio v-model="form.message_type" label="5">求购</el-radio>
        </el-form-item>
        <el-form-item label="主题">
          <el-input type="text" placeholder="请输入主题" v-model="form.subject"></el-input>
        </el-form-item>
        <el-form-item label="内容">
          <el-input
              type="textarea"
              :rows="10"
              placeholder="请输入留言内容"
              v-model="form.message">
          </el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="addMessage">提交</el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script type="text/ecmascript-6">
  import {reqUserMessageCreate} from 'api/user_operation'

  export default {
    name: 'UserMessage',
    data () {
			return {
				form: {
					message_type: '1',
					message: '',
					subject: '',
				}
			}
    },
    methods: {
    	// 添加留言
    	addMessage() {
    		this.$store.dispatch('addMessage', {
					'message_type': this.form.message_type,
					'message': this.form.message,
					'subject': this.form.subject
				})
      }
    }
  }
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  .box-card
    margin-bottom 20px
</style>
