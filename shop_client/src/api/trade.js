import http from "../axios/http"

/***
 * 订单列表
 */
export const getOrders = () => http('GET', '/orders/')

/***
 * 订单详情
 */
export const getOrder = id => http('GET', `/orders/${id}/`)

/***
 * 新增订单
 */
export const postOrder = data => http('POST', '/orders/', data)

/***
 * 删除订单
 */
export const deleteOrder = id => http('DELETE', `/orders/${id}/`)

/***
 * 购物车列表
 */
export const getShoppingCarts = () => http('GET', '/shopping_cart/')

/***
 * 新增购物车
 */
export const postShoppingCart = data => http('POST', '/shopping_cart/', data)

/***
 * 删除购物车
 */
export const deleteShoppingCart = goods_id => http('DELETE', `/shopping_cart/${goods_id}/`)

/***
 * 修改购物车
 */
export const patchShoppingCart = data => http('PATCH', `/shopping_cart/${data.goods}/`, data)
