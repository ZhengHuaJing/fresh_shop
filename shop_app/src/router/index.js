import Vue from 'vue'
import Router from 'vue-router'
import cookie from "../common/js/cookie"
import state from 'store/state'
import { Toast } from 'vant'

Vue.use(Router)

const Index = () => import('pages/Index/Index')
const GoodsDetail = () => import('pages/GoodsDetail/GoodsDetail')
const GoodsList = () => import('pages/GoodsList/GoodsList')
const Order = () => import('pages/Order/Order')
const ShoppingCart = () => import('pages/ShoppingCart/ShoppingCart')
const UserCenter = () => import('pages/UserCenter/UserCenter')
const UserAddress = () => import('pages/UserAddress/UserAddress')
const UserAddressAdd = () => import('pages/UserAddressAdd/UserAddressAdd')
const UserFav = () => import('pages/UserFav/UserFav')
const UserMessage = () => import('pages/UserMessage/UserMessage')
const UserInfo = () => import('pages/UserInfo/UserInfo')
const OrderPay = () => import('pages/OrderPay/OrderPay')
const Login = () => import('pages/Login/Login')
const Register = () => import('pages/Register/Register')
const EmailLogin = () => import('pages/EmailLogin/EmailLogin')


let router =  new Router({
	routes: [
		{
			path: '/',
			redirect: '/index'
		},
		{
			path: '/index',
			component: Index,
			meta: {
				title:'首页',
				need_login: false,
				is_footer: true,
				is_header: false,
			}
		},
		{
			path: '/order',
			component: Order,
			meta: {
				title:'订单列表',
				need_login: true,
				is_footer: true,
				is_header: true,
			}
		},
		{
			path: '/shopping_cart',
			component: ShoppingCart,
			meta: {
				title:'购物车',
				need_login: true,
				is_footer: false,
				is_header: true,
			}
		},
		{
			path: '/user_center',
			component: UserCenter,
			meta: {
				title:'我的',
				need_login: true,
				is_footer: true,
				is_header: true,
			}
		},
		{
			path: '/goods',
			component: GoodsList,
			meta: {
				title:'商品列表',
				need_login: false,
				is_footer: false,
				is_header: true,
			}
		},
		{
			path: '/goods/:id',
			component: GoodsDetail,
			meta: {
				title:'商品详情',
				need_login: false,
				is_footer: false,
				is_header: true,
			}
		},
		{
			path: '/user_address',
			component: UserAddress,
			meta: {
				title:'收货地址',
				need_login: true,
				is_footer: false,
				is_header: true,
			}
		},
		{
			path: '/user_address_add',
			component: UserAddressAdd,
			meta: {
				title:'添加收货地址',
				need_login: true,
				is_footer: false,
				is_header: true,
			}
		},
		{
			path: '/order_pay',
			component: OrderPay,
			meta: {
				title:'订单支付',
				need_login: true,
				is_footer: false,
				is_header: true,
			}
		},
		{
			path: '/user_fav',
			component: UserFav,
			meta: {
				title:'用户收藏',
				need_login: true,
				is_footer: false,
				is_header: true,
			}
		},
		{
			path: '/user_Info',
			component: UserInfo,
			meta: {
				title:'用户信息',
				need_login: true,
				is_footer: false,
				is_header: true,
			}
		},
		{
			path: '/user_message',
			component: UserMessage,
			meta: {
				title:'用户留言',
				need_login: true,
				is_footer: false,
				is_header: true,
			}
		},
		{
			path: '/login',
			component: Login,
			meta: {
				title:'用户登录',
				need_login: false,
				is_footer: false,
				is_header: true,
			}
		},
		{
			path: '/email_login',
			component: EmailLogin,
			meta: {
				title:'邮箱验证登录',
				need_login: false,
				is_footer: false,
				is_header: true,
			}
		},
		{
			path: '/register',
			component: Register,
			meta: {
				title:'用户注册',
				need_login: false,
				is_footer: false,
				is_header: true,
			}
		}
	]
})

// 修改网页标题
router.afterEach((to, from, next) => {
	document.title = to.matched[to.matched.length - 1].meta.title;
})

// 进行路由判断
router.beforeEach((to, from, next) => {
	if (/^\/login/.test(to.path) || /^\/email_login/.test(to.path) || /^\/register/.test(to.path)) {
		if (state.user_token.token) {
			next({path: '/index'})
		} else {
			next()
		}
	} else if (to.meta.need_login) {
		let token = cookie.getCookie('token')

		if (!token) {
			Toast.fail('请先登录')
			cookie.setCookie('next_path', to.path)

			next({path: '/login'})
		} else {
			next()
		}
	} else {
		next()
	}
})


export default router

































