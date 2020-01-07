export default {
	// 计算购物车总价
	getTotalPrice (state) {
		// 计算前先清空旧值以免叠加
		state.total_price = 0

		state.shopping_carts.forEach((item, index) => {
			state.total_price += item.goods.shop_price * item.num
		})
		return state.total_price * 100
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
	// 已支付的订单商品
	getPayGoods (state) {
		let pay_goods_list = []
		state.order_goodses.forEach((item, index) => {
			if (item.pay_status === '已支付') {
				pay_goods_list.push(item)
			}
		})

		return pay_goods_list
	},
	// 待支付的订单商品
	getNotPayGoods (state) {
		let not_pay_goods_list = []
		state.order_goodses.forEach((item, index) => {
			if (item.pay_status === '待支付') {
				not_pay_goods_list.push(item)
			}
		})

		return not_pay_goods_list
	},
	// 累计交易数
	getTotalPay (state) {
		let pay_num = 0
		state.order_goodses.forEach((item, index) => {
			if (item.pay_status === '已支付') {
				pay_num += 1
			}
		})

		return pay_num
	},
	// 累计交易金额
	getPayMoney (state) {
		let pay_money = 0
		state.order_goodses.forEach((item, index) => {
			if (item) {
				if (item.pay_status === '已支付') {
					pay_money += item.goods.shop_price * item.goods_num
				}
			}
		})
		return pay_money
	},
}
