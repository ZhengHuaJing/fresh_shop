import {
	USER_TOKEN,
	USER,
	CATEGORYS,
	GOODSES,
	GOODS,
	NEW_GOODSES,
	HOT_GOODSES,
	HOT_WORDS,
	INDEX_CATEGORYS,
	ORDERS,
	ORDER,
	ORDER_GOODSES,
	SHOPPING_CARTS,
	ADDRESSES,
	FAVS,
	CATEGORY_INDEX,
	PAGING_PARAMS,
} from "./mutation-types"

export default {
	// 用户token
	[USER_TOKEN] (state, data) {
		state.user_token = data
	},
	// 用户信息
	[USER] (state, user) {
		state.user = user
	},
	// 分类列表
	[CATEGORYS] (state, categorys) {
		state.categorys = categorys
	},
	// 商品列表
	[GOODSES] (state, goodses) {
		state.goodses = goodses
	},
	// 商品详情
	[GOODS] (state, goods) {
		state.goods = goods
	},
	// 新品推荐
	[NEW_GOODSES] (state, new_goodses) {
		state.new_goodses = new_goodses
	},
	// 热卖商品
	[HOT_GOODSES] (state, hot_goodses) {
		state.hot_goodses = hot_goodses
	},
	// 热搜词列表
	[HOT_WORDS] (state, hot_words) {
		state.hot_words = hot_words
	},
	// 首页大类模块列表
	[INDEX_CATEGORYS] (state, index_categorys) {
		state.index_categorys = index_categorys
	},
	// 订单列表
	[ORDERS] (state, orders) {
		state.orders = orders
	},
	// 订单详情
	[ORDER] (state, order) {
		state.order = order
	},
	// 订单商品列表
	[ORDER_GOODSES] (state, order_goodses) {
		state.order_goodses = order_goodses
	},
	// 购物车列表
	[SHOPPING_CARTS] (state, shopping_carts) {
		state.shopping_carts = shopping_carts
	},
	// 收货地址列表
	[ADDRESSES] (state, addresses) {
		state.addresses = addresses
	},
	// 收藏列表
	[FAVS] (state, favs) {
		state.favs = favs
	},
	// 首页当前分类的索引
	[CATEGORY_INDEX] (state, category_index) {
		state.category_index = category_index
	},
	// 分页条件
	[PAGING_PARAMS] (state, paging_params) {
		state.paging_params = paging_params
	}
}
