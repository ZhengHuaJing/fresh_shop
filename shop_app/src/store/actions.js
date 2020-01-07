import {
	USER_TOKEN,
	USER,
	TAB_CATEGORYS,
	CATEGORYS,
	GOODSES,
	NEW_GOODSES,
	HOT_GOODSES,
	HOT_WORDS,
	INDEX_CATEGORYS,
	ORDER_GOODSES,
	SHOPPING_CARTS,
	ADDRESSES,
	FAVS, GOODS,
} from "./mutation-types"

import {
	getCategorys,
	getCategory,
	getGoodses,
	getGoods,
	getIndexCategorys,
	getHotWords
} from 'api/goods'

import {
	getOrders,
	getOrder,
	postOrder,
	deleteOrder,
	getShoppingCarts,
	postShoppingCart,
	deleteShoppingCart,
	patchShoppingCart
} from 'api/trade'

import {
	postCode,
	postLogin,
	postUser,
	getUser,
	patchUser
} from 'api/user'

import {
	getAddresses,
	postAddress,
	patchAddress,
	deleteAddress,
	getFavs,
	postFav,
	deleteFav,
	getMessages,
	postMessage,
	deleteMessage,
	patchMessage
} from 'api/user_operation'

import {Toast} from "vant"
import router from 'router'
import cookie from "../common/js/cookie"

export default {
	// 用户登录
	async login ({commit}, data) {
		const response = await postLogin(data)

		if (response.status === 200) {
			Toast.success('登录成功')
			// 保存cookie
			cookie.setCookie('username', data.username, 7)
			cookie.setCookie('token', response.data.token, 7)
			commit(USER_TOKEN, {'username': data.username, 'token': response.data.token})
			// 跳转到上一个页面
			let next_path = cookie.getCookie('next_path')
			if (next_path) {
				cookie.delCookie('next_path')
				router.push(next_path)
			} else {
				router.push('/index')
			}
		} else {
			Toast.fail('用户名或密码错误')
		}
	},
	// 退出登录
	async logout ({commit}) {
		cookie.delCookie('username')
		cookie.delCookie('token')
		commit(USER_TOKEN, {})
		router.push('/login')
	},
	// 发送邮箱验证码
	async sendEmailCode ({}, email) {
		const response = await postCode({'email': email})

		if (response.status === 201) {
			Toast.success('验证码已发送至邮箱')
		} else {
			Toast.fail('距离上一次发送未超过60s')
		}
	},
	// 用户注册
	async register ({commit}, data) {
		const response = await postUser(data)

		if (response.status === 201) {
			Toast.success('注册成功')
			// 保存 cookie
			cookie.setCookie('username', data.username, 7)
			cookie.setCookie('token', response.data.token, 7)
			// 更新到 token
			commit(USER_TOKEN, {'username': data.username, 'token': response.data.token})
			// 跳转到首页
			router.push('/index')
		} else {
			if ('code' in response.data) {
				Toast.fail(response.data.code[0])
			} else if ('username' in response.data) {
				Toast.fail(response.data.username[0])
			}
		}
	},
	// 获取分类列表
	async getCategorys ({commit}, params) {
		const response = await getCategorys(params)

		if (response.status === 200) {
			commit(CATEGORYS, response.data)
		}
	},
	// 获取商品列表
	async getGoodses ({commit}, params={}) {
		const response = await getGoodses(params)

		if (response.status === 200) {
			if ('is_new' in params) {
				commit(NEW_GOODSES, response.data.results.slice(0, 2))
			}

			if ('is_hot' in params) {
				commit(HOT_GOODSES, response.data.results.slice(0, 3))
			}

			commit(GOODSES, response.data)
		}
	},
	// 获取商品详情
	async getGoods ({commit}, id) {
		const response = await getGoods(id)

		if (response.status === 200) {
			commit(GOODS, response.data)
		}
	},
	// 获取热搜词列表
	async getHotWords ({commit}) {
		const response = await getHotWords()

		if (response.status === 200) {
			commit(HOT_WORDS, response.data)
		}
	},
	// 获取首页大类
	async getIndexCategorys ({commit}) {
		const response = await getIndexCategorys()

		if (response.status === 200) {
			commit(INDEX_CATEGORYS, response.data)
		}
	},
	// 获取订单列表
	async getOrders ({commit}) {
		let order_goodses = []
		const response = await getOrders()

		if (response.status === 200) {
			response.data.forEach(async (list_item, index) => {
				const response = await getOrder(list_item.id)
				if (response.status === 200) {
					response.data.goods.forEach((detail_item, index) => {
						detail_item.pay_status = list_item.pay_status
						order_goodses.push(detail_item)
					})
				}
			})
			commit(ORDER_GOODSES, order_goodses)
		}
	},
	// 删除订单
	async delOrder ({dispatch}, id) {
		const response = await deleteOrder(id)

		if (response.status === 204) {
			Toast.success('取消成功')
			dispatch('getOrders')
		}
	},
	// 创建订单
	async addOrder ({dispatch}, data) {
		const response = await postOrder(data)

		if (response.status === 201) {
			Toast.success('订单创建成功，正在前往支付页面')
			window.location.href = response.data.alipay_url
			dispatch('getOrders')
		}
	},
	// 获取购物车列表
	async getShoppingCarts ({commit}) {
		const response = await getShoppingCarts()

		if (response.status === 200) {
			commit(SHOPPING_CARTS, response.data)
		}
	},
	// 删除购物车中的商品
	async delShoppingCart ({dispatch}, goods_id) {
		const response = await deleteShoppingCart(goods_id)

		if (response.status === 204) {
			Toast.success('删除成功')
			dispatch('getShoppingCarts')
		}
	},
	// 清空购物车
	async delAllShoppingCart ({dispatch, state}) {
		state.shopping_carts.forEach((item, index) => {
			dispatch('delShoppingCart', item.goods.id)
		})
		dispatch('getShoppingCarts')
	},
	// 添加购物车商品
	async addShoppingCart ({dispatch}, data) {
		const response = await postShoppingCart(data)

		if (response.status === 201) {
			Toast.success('成功加入购物车')
			dispatch('getShoppingCarts')
		}
	},
	// 修改购物车数量
	async updateShoppingCart ({dispatch}, data) {
		const response = await patchShoppingCart(data)

		if (response.status === 200) {
			dispatch('getShoppingCart')
		}
	},
	// 获取收货地址列表
	async getAddresses ({commit}) {
		const response = await getAddresses()

		if (response.status === 200) {
			commit(ADDRESSES, response.data)
		}
	},
	// 添加收货地址
	async addAddress ({dispatch}, data) {
		const response = await postAddress(data)

		if (response.status === 201) {
			Toast.success('添加成功')
			dispatch('getAddresses')
		}
	},
	// 删除收货地址
	async delAddress ({dispatch}, id) {
		const response = await deleteAddress(id)

		if (response.status === 204) {
			Toast.success('删除成功')
			dispatch('getAddresses')
		}
	},
	// 获取收藏列表
	async getFavs ({commit}) {
		const response = await getFavs()

		if (response.status === 200) {
			commit(FAVS, response.data)
		}
	},
	// 添加收藏
	async addFav ({dispatch}, goods_id) {
		const response = await postFav(goods_id)

		if (response.status === 201) {
			Toast.success('收藏成功')
			dispatch('getFavs')
		} else {
			if ('non_field_errors' in response.data) {
				Toast.fail(response.data.non_field_errors[0])
			}
		}
	},
	// 删除收藏
	async delFav ({dispatch}, goods_id) {
		const response = await deleteFav(goods_id)

		if (response.status === 204) {
			Toast.success('删除成功')
			dispatch('getFavs')
		}
	},
	// 获取用户信息
	async getUser ({commit}) {
		const response = await getUser()

		if (response.status === 200) {
			commit(USER, response.data)
		}
	},
	// 更新用户信息
	async updateUser ({dispatch}, data) {
		// 如果密码字段为空则去除
		if (!data.password.trim()) {
			delete data.password
		}

		const response = await patchUser(data)

		if (response.status === 200) {
			Toast.success('更新成功')
			dispatch('getUser')
		}
	},
	// 添加留言
	async addMessage ({}, data) {
		const response = await postMessage(data)

		if (response.status === 201) {
			Toast.success('发送成功')
		}
	},
}


























