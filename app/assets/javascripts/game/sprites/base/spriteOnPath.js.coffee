class swGame.SpriteOnPath extends swGame.Sprite
  "use strict"
  clockwise: 1
  path: null
  nextPos: null
  sign: null

  postInit: ->
    @width ||= @spriteImage.width
    @height ||= @spriteImage.height
    @path = @globals.path
    @isTurning = false
    @initPos()
    @updateSign()

  move: -> @moveOnPath()

  moveOnPath: ->
    # move the sprite's position
    @location.x += @speed * @sign.x
    @location.y += @speed * @sign.y
    # look up if the sprite is at the end of a segment
    if @sign.x * @location.x >= @sign.x * @nextPos.x and @sign.y * @location.y >= @sign.y * @nextPos.y
      if @isTurning
        @isTurning = false
        # go to the next segment
        @turn()
      else
        # Edge case bug where closing the path on the sprite
        # would cause it to turn and go outside the path
        #@die()
        @isTurning = true 
    # see if we need to show the turning animation
    else if @sign.x * @location.x + @width >= @sign.x * @nextPos.x and @sign.y * @location.y + @width >= @sign.y * @nextPos.y
      @isTurning = true 
    else if @isTurning
      @isTurning = false

  initPos: ->
    scale = 0.5
    while true
      rect = @getRect scale++, 2
      cross = @path.crossesRect rect, true
      #rect.drawRect @globals.ctxBackground
      rect = rect.unmake()
      if cross isnt false
        previousCorner = @path.get cross
        nextIndex = @path.getNextIndex(cross)
        nextCorner = @path.get nextIndex
        if @clockwise is 1
          @nextPos = nextCorner
          @pathIndex = nextIndex
        else
          @nextPos = previousCorner
          @pathIndex = cross
        if previousCorner.x is nextCorner.x
          @location.x = previousCorner.x
          @location.y = @_findMiddle(previousCorner.y, nextCorner.y, @location.y)
        else
          @location.y = previousCorner.y
          @location.x = @_findMiddle(previousCorner.x, nextCorner.x, @location.x)
        return
    null

  _findMiddle: (a, b, c) ->
    max = Math.max a, b, c
    min = Math.min a, b, c
    if a isnt max and a isnt min
      a
    else if b isnt min and b isnt max
      b
    else
      c

  getRect: (scale, position) ->
    position = if position isnt `undefined` then position else @getPosition()
    scale = scale || 1
    xScale = (scale - 1) * @width * 0.5
    yScale = (scale - 1) * @height * 0.5
    adjust = if @isTurning then Math.cos(@getTurningAngle()) else 1
    widthDiff = 0
    if @sign and @nextPos
      if @sign.x and @sign.x * @location.x + @width > @sign.x * @nextPos.x
        widthDiff = @sign.x * @location.x + @width - @sign.x * @nextPos.x
      else if @sign.y and @sign.y * @location.y + @width > @sign.y * @nextPos.y
        widthDiff = @sign.y * @location.y + @width - @sign.y * @nextPos.y
    width = @width - widthDiff
    if @clockwise is 1
      switch position
        when 0 then swGame.Segment.make [@location.x - width * adjust - xScale, @location.y - @height - yScale], [@location.x + xScale, @location.y + yScale]
        when 1 then swGame.Segment.make [@location.x - xScale, @location.y - yScale - width * adjust], [@location.x + @height + yScale, @location.y + xScale]
        when 2 then swGame.Segment.make [@location.x - xScale, @location.y - yScale], [@location.x + xScale + width * adjust, @location.y + yScale + @height]
        when 3 then swGame.Segment.make [@location.x - xScale - @height, @location.y - yScale], [@location.x + yScale, @location.y + xScale + width * adjust]
    else
      switch position
        when 0 then swGame.Segment.make [@location.x - xScale, @location.y - @height - yScale], [@location.x + width * adjust + xScale, @location.y + yScale]
        when 1 then swGame.Segment.make [@location.x - xScale, @location.y - yScale], [@location.x + @height + yScale, @location.y + width * adjust + xScale]
        when 2 then swGame.Segment.make [@location.x - width * adjust - xScale, @location.y - yScale], [@location.x + xScale, @location.y + @height + yScale]
        when 3 then swGame.Segment.make [@location.x - @height - xScale, @location.y - width * adjust - yScale], [@location.x + yScale, @location.y + xScale]

  translateAndRotate: ->
    @ctx.translate @location.x, @location.y
    angle = @getPosition() * Math.PI / 2
    angle += @getTurningAngle() if @isTurning
    @ctx.rotate angle

  getNextPathIndex: ->
    pathlength = @path.length()
    (@directionOnPath + @pathIndex + pathlength) % pathlength

  getPosition: ->
    if @sign.x * @clockwise > 0
      2
    else if @sign.y * @clockwise < 0
      1
    else if @sign.y * @clockwise > 0
      3
    else
      0
    
  getTurningAngle: ->
    newNextPos = @path.get @getNextPathIndex()
    newSign = newNextPos.directionTo @location
    distanceToWall = Math.max Math.abs(@location.x - @nextPos.x), Math.abs(@location.y - @nextPos.y)
    addedAngle = Math.acos distanceToWall / @width
    addedAngle *= @clockwise * @sign.x * newSign.y + @clockwise * @sign.y * newSign.x
    addedAngle = -addedAngle if (@clockwise is -1 and @sign.y is 0) or (@clockwise is 1 and @sign.x is 0)
    addedAngle

  die: ->
    swGame.profile.updateScore(@value) if @value?
    super
  
  destroy: =>
    @sign = @sign?.unmake()
    super
  
  turn: ->
    # adjust position (important only if @speed>1)
    @location.x = @nextPos.x
    @location.y = @nextPos.y
    # go on the next segment
    @pathIndex = @getNextPathIndex()
    @nextPos = @path.get @pathIndex
    @updateSign()

  updateSign: ->
    @sign = @sign?.unmake()
    @sign = @nextPos.directionTo @location

  checkIsInside: ->
    nextDir = @nextPos.directionTo @location
    testLocation = swGame.Point.make @location.x - nextDir.y * @clockwise + nextDir.x, @location.y + nextDir.x * @clockwise + nextDir.y
    #console.log testLocation.isInsidePath(@path.path), @clockwise, testLocation.toString(), @location.toString(), nextDir.toString()
    @clockwise = -@clockwise if not testLocation.isInsidePath(@path)
    testLocation = testLocation.unmake()
    nextDir = nextDir.unmake()
