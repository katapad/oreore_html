class Log
	@enable: true

	@log: (args...)->
		unless @enable
			return
		if typeof console.log == 'function'
			return console.log(args...)

	@info: (args...)->
		unless @enable
			return
		if typeof console.info == 'function'
			return console.info(args...)

	@debug: (args...)->
		unless @enable
			return
		if typeof console.debug == 'function'
			return console.debug(args...)

	@error: (args...)->
		unless @enable
			return
		if typeof console.error == 'function'
			return console.error(args...)
	@dir: (args...)->
		unless @enable
			return
		if typeof console.dir == 'function'
			return console.dir(args...)


if (typeof window.console == "undefined")
	window.console =
		log:->
		info:->
		debug:->
		error:->
		dir:->

	Log.log = ->
	Log.info = ->
	Log.debug = ->
	Log.error = ->
	Log.dir = ->

@Log = Log