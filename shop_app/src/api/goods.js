import http from "../axios/http"

// 分类列表
export const getCategorys = params => http('GET', `/categorys/`, params, true)

// 分类详情
export const getCategory = id => http('GET', `/categorys/${id}/`)

// 商品列表
export const getGoodses = params => http('GET', '/goods/', params, true)

// 商品详情
export const getGoods = id => http('GET', `/goods/${id}`)

// 首页大类模块
export const getIndexCategorys = () => http('GET', '/index_categorys/')

// 首页热搜词
export const getHotWords = () => http('GET', '/hot_words/')









