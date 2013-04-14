class UA
	@ua: window.navigator.userAgent.toLowerCase()
	@win: false
	@mac: false
	@MSIE: false
	@ie6: false
	@ie7: false
	@ie8: false
	@ie9: false
	@ie10: false
	@iPad: false
	@iPhone: false
	@android: false
	@chrome: false
	@webkit: false
	@safari: false
	@firefox: false
	@smartphone: false
	@touchDevice: false



	@init: ->
		@win = @ua.indexOf('windows') > -1;
		@mac = @ua.indexOf('mac') > -1;
		@MSIE = @ua.indexOf('msie');
#		@MSIE = /*@cc_on!@*/0;
		@ie6 = @MSIE && @ua.indexOf('msie 6') > -1;
		@ie7 = @MSIE && @ua.indexOf('msie 7') > -1;
		@ie8 = @MSIE && @ua.indexOf('msie 8') > -1;
		@ie9 = @MSIE && @ua.indexOf('msie 9') > -1;
		@ie10 = @MSIE && @ua.indexOf('msie 10') > -1;
		@iPhone = @ua.indexOf('iphone') > -1 || @ua.indexOf('iphone') > -1 ;
		@iPad = @ua.indexOf('ipad') > -1;
		@android = @ua.indexOf('android') > -1;
		@chrome = @ua.indexOf('chrome') > -1;
		@webkit = @ua.indexOf('webkit') > -1;
		@firefox = @ua.indexOf('firefox') > -1;
		@safari = @ua.indexOf('safari') > -1 && !@chrome && !@android && !@iPhone && !@iPad;

		@smartphone = @iPhone || @android;
		@touchDevice = @iPhone || @iPad || @android;

	@initHtml: ->
		className = []
		if @mac
			className.push "mac"
		else className.push "win"  if @win
		if @android
			className.push "android"
		else className.push "ios"  if @iPhone or @iPad
		if @firefox
			className.push "firefox"
		else className.push "webkit"  if @webkit
		className.push (if @smartphone then "sp" else "pc")
		html = document.getElementsByTagName("html")[0]
		html.className += ' ' + className.join(" ")

