class swGame.Ennemy extends swGame.SpriteInsidePath
  "use strict"

  # see sprite.js.coffee to see how the settings are working
  settings:
    # determine speed of the sprite
    speed: 30
    # number of points killing it is worth
    value: 150
    # determine size of the ennemy (in pixel)
    stickSize: 40
    # determine how big is the ennemy (number of segment)
    stickCount: 6
    # determine how fast the ennemy can change direction
    maxAngleDiff: Math.PI / 64
    # determine how much the ennemy will rotate
    threshold: Math.PI / 16
    # step angle when the ennemy is stuck to get out
    panicAngle: Math.PI / 16
    rgb: "255,0,0"
  
  # instance objects
  # cannot by initialized here
  # See http://html5stars.com/?p=148
  bufferedSticks: null
  newStick: null
  vector: null
  # initial rotation angle
  rotationAngle: 0
  # number of step
  panic: 7
  # when panicCount == panic => the ennemy enters panic mode and tries
  # to get out by moving by increments of panicAngle
  panicCount: 0
  # used as a step to get out of a position where the ennemy is stuck
  escapeCount: 1
  # counter to display the points for a certain amount of cycles (time)
  showPointCounter: 0
  
  _initColors: ->
    @colors = ["rgba(#{@rgb},0.1)", "rgba(#{@rgb},0.2)", "rgba(#{@rgb},0.3)", "rgba(#{@rgb},0.4)", "rgba(#{@rgb},0.5)", "rgb(#{@rgb})"]

  # Sprite interface

  postInit: ->
    super
    # initial position
    @vector = swGame.Point.make(-0.7, -0.7)
    @newStick = swGame.Segment.make(
      [@location.x - @stickSize / 2, @location.y]
      [@location.x + @stickSize / 2, @location.y]
    )
    @location.unmake()
    @location = @newStick.p1
    @bufferedSticks = []
    @bufferedSticks.push @newStick
    @_initColors()

  # SpriteInsidePath interface

  move: ->
    @newStick = @_moveSticks()
    @location = @newStick.p1
    @bufferedSticks.push @newStick 
    @bufferedSticks.shift().unmake() if @bufferedSticks.length > @stickCount
  
  redraw: ->
    super
    # draw
    stickCount = @bufferedSticks.length
    if stickCount == @stickCount
      stick = @bufferedSticks[stickCount - 1]
      while stickCount-- > 1
        @ctx.fillStyle = @colors[stickCount] || @colors[@colors.length - 1]
        @ctx.beginPath()
        @ctx.moveTo(@bufferedSticks[stickCount].p1.x, @bufferedSticks[stickCount].p1.y)
        @ctx.lineTo(@bufferedSticks[stickCount].p2.x, @bufferedSticks[stickCount].p2.y)
        @ctx.lineTo(@bufferedSticks[stickCount - 1].p2.x, @bufferedSticks[stickCount - 1].p2.y)
        @ctx.lineTo(@bufferedSticks[stickCount - 1].p1.x, @bufferedSticks[stickCount - 1].p1.y)
        @ctx.fill()
  
  getRect: ->
    swGame.Segment.make [@newStick.minX(), @newStick.minY()], [@newStick.maxX(), @newStick.maxY()]
  
  getExoskelton: ->
    [@bufferedSticks[0].p1.getCopy(), @bufferedSticks[0].p2.getCopy(), @newStick.p1.getCopy(), @newStick.p2.getCopy()]
    
  # private functions
      
  _moveSticks: ->
    count = 20
    panicMode = false;
    loop
      stick = @_computeStick()
      # change direction if the new stick is out of bounds
      if !stick.isInsidePath @globals.path
        @newStick = @bufferedSticks[1]
        @_updateVector @bufferedSticks[0]
        @newStick = @bufferedSticks[0]
        @rotationAngle = 0
        @bufferedSticks = @bufferedSticks.reverse()
        stick = stick.unmake()
        stick = @_computeStick()
        # reinitialize the panic counter
        panicMode = true if @panicCount < @panic
        @panicCount = 0
      break if stick.isInsidePath(@globals.path) or count--
    console.error("could not keep the ennemy inside!") if !count
    # update direction vector
    # if in panic mode we'll change the direction of the vector completely
    # and intelligently based on which point is outside
    @_updateVector stick, panicMode
    @panicCount++
    stick

  _computeStick: ->
    # translation
    x1 = @newStick.p1.x + @vector.x*@speed
    y1 = @newStick.p1.y + @vector.y*@speed
    x2 = @newStick.p2.x + @vector.x*@speed
    y2 = @newStick.p2.y + @vector.y*@speed
    # rotation angle
    @rotationAngle += 2 * (Math.random() - 0.5) * @maxAngleDiff
    # correction on the angle to avoid spinning around
    if @rotationAngle>@threshold
      @rotationAngle -= @maxAngleDiff 
    else if @rotationAngle<-@threshold
      @rotationAngle += @maxAngleDiff
    swGame.Segment.make([x1, y1], [x2, y2]).rotate(@rotationAngle).resize(@stickSize)
  
  _updateVector: (stick, panicMode) ->
    # stick is the new stick
    # @newStick is the previously drawn stick
    @vector.x = stick.p1.x - @newStick.p1.x
    @vector.y = stick.p1.y - @newStick.p1.y
    @vector.x = 1 if not @vector.x and not @vector.y
    if panicMode
      seg = swGame.Segment.make([0, 0], @vector).rotate(@panicAngle * @escapeCount)
      @vector.x = seg.p2.x
      @vector.y = seg.p2.y
      seg = seg.unmake()
      @escapeCount = if @escapeCount*@panicAngle == 2 * Math.PI then 1 else @escapeCount + 1
      @escapeCount++ if @escapeCount*@panicAngle == Math.PI
    # normalize
    @vector.normalize()
    
  # events
    
  destroy: =>
    @bufferedSticks.shift().unmake() while @bufferedSticks.length
    @location = null
    @vector = @vector?.unmake()
    super
