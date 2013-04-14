class Main
	@init: ->
		console.log 'main init'

init = ->
#	Log.enable = LogEnable
	UA.init()
	UA.initHtml()

mainInit = ->
	Main.init()

$(mainInit)


