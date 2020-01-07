const path = require('path');

function resolve(dir) {
	return path.join(__dirname, dir)
}

module.exports = {
	productionSourceMap: false,
	lintOnSave: false,
	chainWebpack: config => {
		config.entry.app = ["babel-polyfill", resolve('src/main.js')],
			config.resolve.alias
				.set('@', resolve('src'))
				.set('components', resolve('src/components'))
				.set('common', resolve('src/common'))
				.set('pages', resolve('src/pages'))
				.set('router', resolve('src/router'))
				.set('store', resolve('src/store'))
				.set('api', resolve('src/api'))
	},
}
