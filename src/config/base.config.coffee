BASE_PATH = 'http://example.com/'



module.exports = exports =
	common:
		analytics:
			id: 'UA-1'
			domain: 'example.com'

		lang: 'ja'

		twitter:
			tweet: 'hogehoge'
			lang: 'ja'

		google_plus_one:
			lang: 'ja'

		fb:
			lang: 'ja_JP'
			app_id: 1


		title: '俺のサイト'
		description: ''
		keywords: ''

		og:
			url:''
			title:''
			site_name:''
			description:''
			image:''
			locale:'ja_JP'


	develop:
		commonImgSrc: '/common/img'
		commonCssSrc: '/common/css'
		commonJsSrc: '/common/js'
		imgSrc: '/img'
		cssSrc: '/css'
		jsSrc: '/js'

		fb:
			app_id: 2
		debug: true


	production:
		commonImgSrc: "#{BASE_PATH}common/img"
		commonCssSrc: "#{BASE_PATH}common/css"
		commonJsSrc: "#{BASE_PATH}common/js"
		imgSrc: "#{BASE_PATH}js"
		cssSrc: "#{BASE_PATH}css"
		js: "#{BASE_PATH}js"

		fb:
			app_id: 3
		debug: false
