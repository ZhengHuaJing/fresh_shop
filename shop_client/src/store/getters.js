export default {
	// 首页导航栏展示的分类列表
	getTabCategorys (state) {
		let tab_cotegorys = []
		state.categorys.forEach((item, index) => {
			if (item.is_tab) {
				tab_cotegorys.push(item)
			}
		})

		return tab_cotegorys
	},
	// 索引对应的分类
	getCategory (state) {
		return state.categorys[state.category_index]
	},
	// 计算购物车总价
	getTotalPrice (state) {
		// 计算前先清空旧值以免叠加
		state.total_price = 0

		state.shopping_carts.forEach((item, index) => {
			state.total_price += item.goods.shop_price * item.num
		})
		return state.total_price
	},
	// 计算购物车总件数
	getTotalNum (state) {
		// 计算前先清空旧值以免叠加
		state.total_num = 0

		state.shopping_carts.forEach((item, index) => {
			state.total_num += item.num
		})
		return state.total_num
	},
	// 处理订单中下单时间格式
	getOrders (state) {
		state.orders.forEach((item, index) => {
			item.add_time = item.add_time.split('T')[0] + ' ' + item.add_time.split('T')[1].split('.')[0]
		})

		return state.orders
	}
}
