class swGame.BubbleLauncher
  ctx: null
  bubbles: null
  options: null
  frequency: 5

  deactivate: =>
    @bubbles = null
    pubsub.unsubscribe "repaint", @updateBubbles

  init: ->
    @bubbles = []
    pubsub.subscribe "repaint", @updateBubbles

class swGame.FullscreenBubbles extends swGame.BubbleLauncher
  maxBubbleCount: 50
  frameBubble: null
  updateBubbles: =>
    swGame.ui.clearFullCanvas()
    if Math.floor(Math.random() * @frequency) == 0
      @bubbles.push new swGame.Bubble(@ctx, @options)
    @bubbles.shift() if @bubbles.length > @maxBubbleCount
    bubble.redraw() for bubble in @bubbles
    @frameBubble.redraw() if @frameBubble
  createFrameBubble: ->
    @frameBubble = new swGame.Bubble @ctx,
      x: swGame.globals.fullCanvas.width / 2
      y: swGame.globals.fullCanvas.height / 2
      radius: 100
      color: "hsla(0, 0%, 0%, 0.3)"
      fixed: true
  deleteFrameBubble: ->
    @frameBubble = null
  constructor: (bubbleCount, frequency, maxStartSize) ->
    super # otherwise deactivate's fat arrow won't work!
    @ctx = swGame.globals.ctxFullCanvas
    @maxBubbleCount = bubbleCount if bubbleCount
    @frequency = frequency if frequency
    paused = false
    @options =
      maxStartSize: maxStartSize
      opacity: 0.7
    @init()

class swGame.LocalBubbles extends swGame.BubbleLauncher
  timer: null
  canCreateBubbles: true
  updateBubbles: =>
    done = true
    if @canCreateBubbles
      @bubbles.push new swGame.Bubble(@ctx, @options)
    for bubble in @bubbles
      done = false if bubble.redraw() 
    @deactivate() if done and @bubbles.length
  deactivate: =>
    @timer = clearTimeout(@timer) if @timer
    pubsub.unsubscribe "newLevel", @deactivate
    super
  stopWhenDone: ->
    @canCreateBubbles = false
    bubble.stopWhenDone = true for bubble in @bubbles
  constructor: (x, y) ->
    super # otherwise deactivate's fat arrow won't work!
    @ctx = swGame.globals.ctx
    @frequency = 5
    @options =
      xOrigin: x
      yOrigin: y
      areaSize: 100
      maxStartSize: 0.2
      opacity: 0.8
    @init()
    @timer = setTimeout (=> @stopWhenDone()), 1500
    pubsub.subscribe "newLevel", @deactivate

class swGame.Bubble
  getRandomColor: -> "hsla(#{Math.random()*360}, #{40+Math.random()*60}%, #{30+Math.random()*70}%, #{@settings.opacity})"
  isLastRound: false
  stopWhenDone: false
  constructor: (ctx, settings) ->
    @ctx = ctx
    @settings = settings || {}
    @settings.width = @settings.areaSize || swGame.globals.fullCanvas.width
    @settings.height = @settings.areaSize || swGame.globals.fullCanvas.height
    if @settings.xOrigin and @settings.yOrigin
      @xOrigin = @settings.xOrigin - @settings.areaSize / 2
      @yOrigin = @settings.yOrigin - @settings.areaSize / 2
    else
      @xOrigin = 0
      @yOrigin = 0
    @_init()
  _init: ->
    @isLastRound = @stopWhenDone
    @fixed = @settings.fixed || false
    @x = @settings.x || @xOrigin + @settings.width * Math.random()
    @y = @settings.y || @yOrigin + @settings.height * Math.random()
    maxDimension = Math.max(@settings.width, @settings.height)
    @radius = @settings.radius || Math.random() * maxDimension * @settings.maxStartSize
    @startRadius = @radius
    @color = @settings.color || @getRandomColor()
    @counter = 1
    @dimensionRatio = @settings.width / @settings.height
  redraw: ->
    return false if @isLastRound
    isOutside = @_isOutside(distanceFromCenterX, distanceFromCenterY)
    @ctx.save()
    @ctx.fillStyle = @color
    @ctx.strokeStyle = @color
    @ctx.lineWidth = 3
    @ctx.beginPath()
    @ctx.arc @x, @y, @radius, 0, Math.PI*2, true
    if isOutside
      @ctx.stroke()
    else
      @ctx.fill()
    @ctx.restore()
    delta = Math.log(1 + @counter / 10)
    if not @fixed
      distanceFromCenterX = @x - (@xOrigin + @settings.width / 2)
      distanceFromCenterY = @y - (@yOrigin + @settings.height / 2)
      @x = @x + delta * distanceFromCenterX * @dimensionRatio * 4 / @settings.width
      @y = @y + delta * distanceFromCenterY * 4 / @settings.height
    @radius = @startRadius * (1 + delta) if @radius < 440
    @counter++
    @_init() if isOutside
    true
  _isOutside: (distanceFromCenterX, distanceFromCenterY) ->
    if @settings.areaSize
      Math.max(Math.abs(distanceFromCenterX), Math.abs(distanceFromCenterY)) > @settings.areaSize * 2
    else
      @x - @radius > @settings.width or @x + @radius < 0 or @y - @radius > @settings.height or @y + @radius < 0
