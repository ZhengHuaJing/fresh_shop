/***
 *  http请求函数模块
 *  return: promise对象(异步返回的数据是: response.data)
 */
import axios from './index'

export default function http (requestType, url, data={}, isQuestionMarkJoint=false) {
	return new Promise(function (resolve, reject) {
		// 判断url是否需要用？号拼接参数
		if (isQuestionMarkJoint) {
			url = questionMarkJoint(url, data)
		}
		// 执行异步ajax请求
		getPromise(url, data, requestType).then(function (response) {
			resolve(response)
		}).catch(function (error) {
			resolve(error)
		})
	})
}

// 以 /goods/?search=牛奶 的形式来拼接url
function questionMarkJoint (url, params) {
	let dataStr = ''
	Object.keys(params).forEach(key => {
		dataStr += key + '=' + params[key] + '&'
	})
	if (dataStr !== '') {
		url = url + '?' + dataStr.substring(0, dataStr.lastIndexOf('&'))
	}

	return url
}

// 根据请求不同的请求方法，返回对应的 Promise 对象
function getPromise (url, data, requestType) {
	switch (requestType) {
		case 'GET':
			return axios.get(url)
		case 'POST':
			return axios.post(url, data)
		case 'PATCH':
			return axios.patch(url, data)
		case 'DELETE':
			return axios.delete(url)
	}
}














