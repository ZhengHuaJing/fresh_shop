<template>
  <div>
    <van-cell-group>
      <van-field
          v-model="name"
          label="姓名"
          placeholder="请输入姓名"
      ></van-field>
      <van-field
          v-model="gender"
          label="性别">
        <van-radio-group slot="input" v-model="gender">
          <van-radio name="男">男</van-radio>
          <van-radio name="女">女</van-radio>
        </van-radio-group>
      </van-field>
      <van-field
          v-model="birthday"
          label="出生年月">
        <span @click="showPopup" slot="input">{{birthday | formatDate}}</span>
      </van-field>
      <van-field
          v-model="email"
          disabled
          label="邮箱"
      ></van-field>
      <van-field
          v-model="mobile"
          label="手机号"
          placeholder="请输入手机号"
      ></van-field>
      <van-field
          v-model="password"
          type="password"
          label="新密码"
          placeholder="如要修改密码请输入"
      ></van-field>
    </van-cell-group>
    <van-popup v-model="show">
      <van-datetime-picker
          @confirm="showPopup"
          @cancel="showPopup"
          v-model="birthday"
          type="date"
          :min-date="min_date"
          :formatter="formatter"
      ></van-datetime-picker>
    </van-popup>
    <van-submit-bar
        button-text="提交修改"
        @submit="updateUser">
    </van-submit-bar>
  </div>
</template>

<script type="text/ecmascript-6">
  import { CellGroup, Field, RadioGroup, Radio, Popup, DatetimePicker, SubmitBar } from 'vant'
  import { mapState } from 'vuex'
  import state from 'store/state'
  import { formatDate } from 'common/js/date'

  export default {
    name: 'UserInfo',
    data () {
    	return {
				birthday: new Date(),
				show: false,
				min_date: new Date(1970, 1, 1),
        password: '',
      }
    },
    components: {
    	[CellGroup.name]: CellGroup,
      [Field.name]: Field,
      [RadioGroup.name]: RadioGroup,
      [Radio.name]: Radio,
      [Popup.name]: Popup,
      [DatetimePicker.name]: DatetimePicker,
      [SubmitBar.name]: SubmitBar
    },
    methods: {
    	// 是否显示时间选择器
			showPopup() {
				this.show = !this.show
			},
      // 格式时间
			formatter(type, value) {
				if (type === 'year') {
					return `${value}年`
				} else if (type === 'month') {
					return `${value}月`
				} else {
					return `${value}日`
        }
				return value
			},
			// 更新用户信息
			updateUser () {
				console.log(this.name)
				this.$store.dispatch('updateUser', {
					'name': this.name,
					'birthday': formatDate(this.birthday, 'yyyy-MM-dd'),
					'gender': this.gender,
					'mobile': this.mobile,
					'password': this.password
				})
			}
    },
		computed: {
			...mapState(['user']),
			name: {
				get () {
					return this.user.name
				},
				set (value) {
					state.user.name = value
					this.$store.commit(USER, state.user)
				}
			},
			birthday: {
				get () {
					return this.user.birthday
				},
				set (value) {
					state.user.birthday = value
					this.$store.commit(USER, state.user)
				}
			},
			gender: {
				get () {
					return this.user.gender
				},
				set (value) {
					state.user.gender = value
					this.$store.commit(USER, state.user)
				}
			},
			email: {
				get () {
					return this.user.email
				},
				set (value) {
					state.user.email = value
					this.$store.commit(USER, state.user)
				}
			},
			mobile: {
				get () {
					return this.user.mobile
				},
				set (value) {
					state.user.mobile = value
					this.$store.commit(USER, state.user)
				}
			},
		},
    filters: {
			formatDate(time) {
				var date = new Date(time)
				return formatDate(date, 'yyyy-MM-dd')
			}
		},
    created() {
			// 用户信息
			this.$store.dispatch('getUser')
		}
	}
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
  .van-radio
    float left
    margin-right 20px
  .van-popup
    width 300px
</style>
