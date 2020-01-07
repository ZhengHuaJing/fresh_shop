import http from "../axios/http"

/***
 * 邮箱验证码
 */
export const postCode = data => http('POST', '/code/', data)

/***
 * 用户登录
 */
export const postLogin = data => http('POST', '/login/', data)

/***
 * 用户注册
 */
export const postUser = data => http('POST', '/user/', data)

/***
 * 用户详情
 * 后端默认只返回当前登录的用户信息，用户ID可随意
 */
export const getUser = () => http('GET', '/user/1/')

/***
 * 用户信息修改
 * 后端默认只能修改当前登录的用户信息，用户ID可随意
 */
export const patchUser = data => http('PATCH', '/user/1/', data)

