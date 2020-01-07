<template>
  <div>
    <el-card class="box-card">
      <div slot="header">
        <span>个人资料</span>
      </div>
      <el-form label-width="80px">
        <el-form-item label="姓名">
          <el-input v-model="name"></el-input>
        </el-form-item>
        <el-form-item label="性别">
          <el-select v-model="gender" placeholder="请选择性别">
            <el-option label="男" value="男"></el-option>
            <el-option label="女" value="女"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="日期">
          <el-date-picker
              type="date"
              value-format="yyyy-MM-dd"
              placeholder="选择日期"
              v-model="birthday"
              style="width: 100%;"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="邮箱">
          <el-input type="email" v-model="email" :disabled="true"></el-input>
        </el-form-item>
        <el-form-item label="手机">
          <el-input type="tel" v-model="mobile"></el-input>
        </el-form-item>
        <el-form-item label="新密码">
          <el-input type="password" v-model="password" placeholder="如要修改密码，则输入新密码"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="updateUser">确定</el-button>
          <el-button>取消</el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script type="text/ecmascript-6">
  import {mapState} from 'vuex'
  import {USER} from "store/mutation-types"
  import state from 'store/state'

	export default {
    name: 'UserInfo',
    data () {
    	return {
    		password: '',
      }
    },
    methods: {
    	// 更新用户信息
			updateUser () {
        this.$store.dispatch('updateUser', {
						'name': this.name,
						'birthday': this.birthday,
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
    created() {
    	// 用户信息
      this.$store.dispatch('getUser')
		}
	}
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">

</style>
