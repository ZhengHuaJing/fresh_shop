<template>
  <div>
    <van-cell-group>
      <van-field
          v-model="username"
          label="留言类型">
        <van-radio-group slot="input" v-model="message_type">
          <van-radio name="1">留言</van-radio>
          <van-radio name="2">投诉</van-radio>
          <van-radio name="3">咨询</van-radio>
          <van-radio name="4">售后</van-radio>
          <van-radio name="5">求购</van-radio>
        </van-radio-group>
      </van-field>
      <van-field
          v-model="subject"
          label="主题"
          placeholder="请输入姓名">
      </van-field>
      <van-field
          v-model="message"
          rows="8"
          autosize
          label="内容"
          type="textarea"
          maxlength="500"
          placeholder="请输入留言"
          show-word-limit>
      </van-field>
    </van-cell-group>
    <van-submit-bar
        button-text="提交留言"
        @submit="addMessage">
    </van-submit-bar>
  </div>
</template>

<script type="text/ecmascript-6">
  import { CellGroup, Field, RadioGroup, Radio, SubmitBar } from 'vant'

  export default {
    name: 'UserMessage',
    data () {
    	return {
				message_type: '1',
				message: '',
				subject: '',
      }
    },
    components: {
    	[CellGroup.name]: CellGroup,
      [Field.name]: Field,
      [RadioGroup.name]: RadioGroup,
      [Radio.name]: Radio,
      [SubmitBar.name]: SubmitBar
    },
		methods: {
			// 添加留言
			addMessage() {
				this.$store.dispatch('addMessage', {
					'message_type': this.message_type,
					'message': this.message,
					'subject': this.subject
				})
			}
		}
  }
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  .van-radio
    float left
    margin-right 20px

</style>
