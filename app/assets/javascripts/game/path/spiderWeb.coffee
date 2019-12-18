# Create a context with a spiderWed drawn inside
swGame.spiderWeb = do ->
	webCanvas = document.createElement "canvas"
	webContext = webCanvas.getContext "2d"
	frame = 0
	frameCount = 20
	path = null

	somewhereBetween = (a, b) ->
		min = Math.min a, b
		max = Math.max a, b
		min + Math.round Math.random()*(max-min)
	
	spin360 = (distance, center, size) ->
		angStep = Math.PI / 8
		angle = angStep
		angLimit = angStep + Math.PI * 2
		quadraticDiff = size / 4
		seg = swGame.Segment.make([distance + center.x, center.y], [distance + center.x + size, center.y]).round()
		quadraticSeg = seg.getCopy()
		quadraticSeg.p2.x -= quadraticDiff
		quadraticSeg.rotateAtOrigin angStep / 2, center.x, center.y
		while angle <= angLimit
			webContext.moveTo seg.p1.x, seg.p1.y
			webContext.lineTo seg.p2.x, seg.p2.y
			seg.rotateAtOrigin angStep, center.x, center.y
			webContext.quadraticCurveTo quadraticSeg.p2.x, quadraticSeg.p2.y, seg.p2.x, seg.p2.y
			quadraticSeg.rotateAtOrigin angStep, center.x, center.y
			angle += angStep
		seg.unmake()
		quadraticSeg.unmake()

	cancelAnimation = ->
		path = path?.destroy()
		pubsub.unsubscribe "repaint", repaint

	repaint = ->
		return cancelAnimation() if frame-- is 0
		clipAndDraw swGame.globals.ctx, (destCtx) ->
			destCtx.fillStyle = "rgba(255, 255, 255, #{frame / (frameCount - 1)})"
			destCtx.fillRect 0, 0, swGame.globals.canvas.width, swGame.globals.canvas.height

	clipAndDraw = (destCtx, drawFct) ->
		destCtx.save()
		destCtx.beginPath()
		path.drawPathInContext destCtx
		destCtx.clip()
		drawFct destCtx
		destCtx.restore()

	init = ->
		webCanvas.width = swGame.globals.width
		webCanvas.height = swGame.globals.height
		webContext.strokeStyle = "#fff"
		webContext.shadowColor = 'rgba(0, 0, 0, 0.4)'
		webContext.shadowOffsetX = -1
		webContext.shadowOffsetY = 1
		#qwwebContext.lineWidth = 2
		center = swGame.Point.make webCanvas.width / 2, webCanvas.height / 2 
		# marge answers the question: What is the radius of smallest circle that contains the rectangle?
		marge = Math.sqrt Math.pow(webCanvas.width, 2) + Math.pow(webCanvas.height, 2)
		distance = 0
		linStep = 20
		webContext.beginPath()
		while distance <= marge
			spin360 distance, center, linStep
			distance += linStep
		webContext.stroke()
		center.unmake()

	pubsub.subscribe "init", init
	pubsub.subscribe "showHome", cancelAnimation

	draw: (_path) ->
		path = _path.getCopy()
		frame = frameCount
		centerOfMass = path.getCenterOfMass()
		clipAndDraw swGame.globals.ctxBackground, (destCtx) ->
			destCtx.drawImage webCanvas, Math.floor(centerOfMass.x - webCanvas.width / 2), Math.floor(centerOfMass.y - webCanvas.height / 2)
		centerOfMass.unmake()
		pubsub.subscribe "repaint", repaint