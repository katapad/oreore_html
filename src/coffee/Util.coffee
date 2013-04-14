class Util
	@getScrollPosition: ->
		return {
			x: document.documentElement.scrollLeft || document.body.scrollLeft
			y: document.documentElement.scrollTop || document.body.scrollTop
		}

	@getDocumentSize: ->
		return {
			width: document.documentElement.scrollWidth || document.body.scrollWidth
			height: document.documentElement.scrollHeight || document.body.scrollHeight
		}

#	getScreenSize: ->
#		obj = {}
#		if not isSafari and not isOpera
#			obj.x = document.documentElement.clientWidth or document.body.clientWidth or document.body.scrollWidth
#			obj.y = document.documentElement.clientHeight or document.body.clientHeight or document.body.scrollHeight
#		else
#			obj.x = window.innerWidth
#			obj.y = window.innerHeight
#		obj.mx = parseInt((obj.x) / 2)
#		obj.my = parseInt((obj.y) / 2)
#		return obj

	@getScreenSize: ->
		return {
			x: document.body.clientWidth || document.documentElement.clientWidth,
			y: document.body.clientHeight || document.documentElement.clientHeight
		}




