swGame.device = do ->
	touch: (("ontouchstart" of window) or window.DocumentTouch and document instanceof DocumentTouch)
	mobile: navigator?.userAgent.match(/(iPhone|iPod|iPad|Android|BlackBerry|IEMobile)/)