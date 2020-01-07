import http from "../axios/http"

/***
 * 用户收货地址列表
 */
export const getAddresses = () => http('GET', '/user_address/')

/***
 * 增加用户收货地址
 */
export const postAddress = data => http('POST', '/user_address/', data)

/***
 * 修改用户收货地址
 */
export const patchAddress = (id, data) => http('PATCH', `/user_address/${id}/`, data)

/***
 * 删除用户收货地址
 */
export const deleteAddress = id => http('DELETE', `/user_address/${id}/`)

/***
 * 用户收藏列表
 */
export const getFavs = () => http('GET', '/user_fav/')

/***
 * 新增用户收藏
 */
export const postFav = data => http('POST', '/user_fav/', data)

/***
 * 删除用户收藏
 */
export const deleteFav = goods_id => http('DELETE', `/user_fav/${goods_id}/`)

/***
 * 用户留言列表
 */
export const getMessages = () => http('GET', '/user_message/')

/***
 * 新增用户留言
 */
export const postMessage = data => http('POST', '/user_message/', data)

/***
 * 删除用户留言
 */
export const deleteMessage = id => http('DELETE', `/user_message/${id}/`)

/***
 * 修改用户留言
 */
export const patchMessage = (id, data) => http('PATCH', `/user_message/${id}/`, data)
