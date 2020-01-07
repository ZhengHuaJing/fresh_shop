import Vue from 'vue'
import Router from 'vue-router'
import cookie from "../common/js/cookie"
import store from 'store'
import { Message } from 'element-ui';

Vue.use(Router)

const Home = () => import('pages/Home/Home')
const Index = () => import('pages/Index/Index')
const GoodsDetail = () => import('pages/GoodsDetail/GoodsDetail')
const GoodsList = () => import('pages/GoodsList/GoodsList')
const UserCenter = () => import('pages/UserCenter/UserCenter')
const UserAddress = () => import('pages/UserAddress/UserAddress')
const UserFav = () => import('pages/UserFav/UserFav')
const UserMessage = () => import('pages/UserMessage/UserMessage')
const Order = () => import('pages/Order/Order')
const UserInfo = () => import('pages/UserInfo/UserInfo')
const User = () => import('pages/User/User')
const Login = () => import('pages/Login/Login')
const Register = () => import('pages/Register/Register')
const EmailLogin = () => import('pages/EmailLogin/EmailLogin')
const ShoppingCart = () => import('pages/ShoppingCart/ShoppingCart')
const OrderDetail = () => import('pages/OrderDetail/OrderDetail')


let router =  new Router({
	routes: [
		{
			path: '/',
			redirect: '/home/index'
		},
		{
			path: '/home',
			component: Home,
			children: [
				{
					path: 'detail/:id',
					component: GoodsDetail,
					meta: {
						title:'商品详情',
						need_login: false
					}
				},
				{
					path: 'index',
					component: Index,
					meta: {
						title:'首页',
						need_login: false
					}
				},
				{
					path: 'list',
					component: GoodsList,
					meta: {
						title:'商品列表',
						need_login: false
					}
				},
				{
					path: 'user_center',
					component: UserCenter,
					children: [
						{
							path: 'address',
							component: UserAddress,
							meta: {
								title:'用户中心-地址',
								need_login: true
							}
						},
						{
							path: 'fav',
							component: UserFav,
							meta: {
								title:'用户中心-收藏',
								need_login: true
							}
						},
						{
							path: 'message',
							component: UserMessage,
							meta: {
								title:'用户中心-留言',
								need_login: true
							}
						},
						{
							path: 'order',
							component: Order,
							meta: {
								title:'用户中心-订单',
								need_login: true
							}
						},
						{
							path: 'order_detail/:id',
							component: OrderDetail,
							meta: {
								title:'用户中心-订单',
								need_login: true
							}
						},
						{
							path: 'user_info',
							component: UserInfo,
							meta: {
								title:'用户中心-资料',
								need_login: true
							}
						}
					]
				}
			]
		},
		{
			path: '/shopping_cart',
			component: ShoppingCart,
			meta: {
				title:'购物车',
				need_login: true
			}
		},
		{
			path: '/user',
			component: User,
			children: [
				{
					path: 'login',
					component: Login,
					meta: {
						title:'用户登录',
						need_login: false
					}
				},
				{
					path: 'email_login',
					component: EmailLogin,
					meta: {
						title:'邮箱验证登录',
						need_login: false
					}
				},
				{
					path: 'register',
					component: Register,
					meta: {
						title:'用户注册',
						need_login: false
					}
				}
			]
		}
	]
})

// 修改网页标题
router.afterEach((to, from, next) => {
	document.title = to.matched[to.matched.length - 1].meta.title;
})

// 进行路由判断
router.beforeEach((to, from, next) => {
	if (to.path.substring(6, 0, 5) === '/user/' && store.state.user_token.token) {
		Message.error('已登录，无需重复登录')
		next({path: '/home/index'})
	} else if (to.meta.need_login) {
		let token = cookie.getCookie('token')

		if (!token) {
			cookie.setCookie('next_path', to.path)
			next({path: '/user/login'})
		} else {
			next()
		}
	} else {
		next()
	}
})

export default router

































