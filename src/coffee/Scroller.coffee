class Scroller
	@to: (top, delay = 50, time = 550, ease = 'easeInOutQuint') ->
		$("html,body").delay(delay).animate({ scrollTop: top }, time, ease)