import axios from 'axios'
import router from 'router'
import store from 'store'
import cookie from "../common/js/cookie"
import { USER_TOKEN } from "store/mutation-types"
import { Toast } from 'vant'

// axios 配置
axios.defaults.timeout = 5000
axios.defaults.baseURL = 'http://127.0.0.1:8000'

// http request 拦截器
axios.interceptors.request.use(
	config => {
		if (store.state.user_token.token) {
			config.headers.Authorization = `JWT ${store.state.user_token.token}`
		}
		return config
	},
	err => {
		return Promise.reject(err)
	},
)

// http response 拦截器
axios.interceptors.response.use(
	response => {
		return response
	},
	error => {
		if (error.response) {
			switch (error.response.status) {
				case 401:
					// 跳转登录界面
					Toast.fail('请先登录')
					cookie.delCookie('token')
					store.commit(USER_TOKEN, {})
					if (router.currentRoute.path !== '/login') {
						router.push('/user/login')
					}
					break
				case 429:
					Toast.fail('操作过于频繁，请稍后再试')
			}
		}
		return Promise.reject(error.response)
	},
)

export default axios
