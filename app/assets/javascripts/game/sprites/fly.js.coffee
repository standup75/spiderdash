class swGame.Fly extends swGame.SpriteInsidePath
  "use strict"
  spriteImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/fly.png"
  spriteBlueImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/fly_blue.png"

  # see sprite.js.coffee to see how the settings are working
  settings:
    # determine speed of the sprite
    speed: 24
    # number of points killing it is worth
    value: 150
    # determine how fast the ennemy can change direction
    maxAngleDiff: Math.PI/32
    # determine how much the ennemy will rotate
    threshold: Math.PI/16
    panicAngle: Math.PI/32
    canSmell: false
    scale: 1
  
  # instance objects
  # cannot by initialized here
  # See http://html5stars.com/?p=148
  vector: null
  # determine size of the fly (in pixel)
  width: 80
  height: 66
  frameDuration: 1
  frameCount: 6
  # initial rotation angle
  rotationAngle: 0
  # commit suicide if count == 10 (the fly is stuck somewhere)
  count: 0
  # counter to display the points for a certain amount of cycles (time)
  showPointCounter: 0
  bounced: false

  # Sprite interface
    
  postInit: ->
    super
    # initial position
    @vector = swGame.Point.make 1, 0
    @reversedVector = swGame.Point.make 0, 0
    @_scaleImages()


  # SpriteInsidePath interface

  move: ->
    # sometimes the fly got stuck, in this case we kill it
    if @bounced
      @count++
      if @count is 10
        @panicMode = true
        return
    else
      @count = 0
    
    # last resort is going back, so we init a variable to prepare this move
    @reversedVector.init -@vector.x, -@vector.y
    # 1/ first try, simple rotation
    @_rotateVector()
    # check if the new point is in the wall
    intersectionPathIndex = @_updateLocation()
    @bounced = false
    @panicMode = false if @panicMode and intersectionPathIndex is false
    return if intersectionPathIndex is false or @panicMode
    @bounced = true
    # 2/ if it's in the wall try to bounce
    @_bounceVector intersectionPathIndex
    # check if the new point is in the wall
    return if @_updateLocation() is false
    # 3/ turn 180 degrees
    @vector.init @reversedVector.x, @reversedVector.y
    @_updateLocation()
  
  redraw: (frameNumber) ->
    super
    image = if @globals.isOnPill then @spriteBlueImageScaled else @spriteImageScaled
    @ctx.save()
    @ctx.translate @location.x, @location.y
    @ctx.rotate Math.atan2(@vector.y, @vector.x) - Math.PI / 2
    @ctx.drawImage image, frameNumber * @width, 0, @width, @height, Math.round(-@width / 2), Math.round(-@height / 2), @width, @height
    @ctx.restore()

  getRect: (location = @location) ->
    h = Math.round @height / 2
    w = Math.round @width / 2
    swGame.Segment.make [location.x - w, location.y - h], [location.x + w, location.y + h]

  # private functions

  _rotateVector: ->
    # rotate
    if @panicMode
      @rotationAngle = @panicAngle
    else
      turningDirection = @_turnToThePlayer() || 2 * (Math.random() - 0.5)
      @rotationAngle += turningDirection * @maxAngleDiff
    # correction on the angle to avoid spinning around
    if @rotationAngle > @threshold
      @rotationAngle -= @maxAngleDiff 
    else if @rotationAngle < -@threshold
      @rotationAngle += @maxAngleDiff
    seg = swGame.Segment.make([0,0], @vector).rotate(@rotationAngle)
    @vector.x = seg.p2.x - seg.p1.x
    @vector.y = seg.p2.y - seg.p1.y
    seg = seg.unmake()

    # normalize
    @vector.normalize()

  _turnToThePlayer: ->
    res = false
    if @globals.player and @canSmell
      toPlayerSegment = swGame.Segment.make [@location.x, @location.y], [@globals.player.x, @globals.player.y]
      if not toPlayerSegment.crossesPath @globals.path
        toPlayerVector = swGame.Point.make @location.x - @globals.player.x, @location.y - @globals.player.y
        res = if @vector.perpDotProduct(toPlayerVector) < 0 then 0.5 else -0.5
        toPlayerVector = toPlayerVector.unmake()
      toPlayerSegment = toPlayerSegment.unmake()
    res

  _bounceVector: (intersectionPathIndex) ->
    # bouncing logic
    path = @globals.path
    nextIndex = (intersectionPathIndex + 1) % path.length()
    seg1 = path.get intersectionPathIndex
    seg2 = path.get nextIndex
    # is it bouncing on an horizontal plan or vertical?
    if seg1.x is seg2.x
      # vertical
      @vector.x = -@vector.x
    else
      # horizontal
      @vector.y = -@vector.y

  _updateLocation: ->
    anticipatedLocation = swGame.Point.make(@location.x + @speed * @vector.x, @location.y + @speed * @vector.y).round()
    rect = @getRect(anticipatedLocation)
    intersectionPathIndex = @globals.path.crossesRect rect, true
    rect = rect.unmake()
    if intersectionPathIndex is false
      @location.unmake()
      @location = anticipatedLocation
    else
      anticipatedLocation = anticipatedLocation.unmake()
    intersectionPathIndex

  _scaleImages: ->
    @_scaleImage "spriteImage"
    @_scaleImage "spriteBlueImage"
    @width = @spriteImageScaled.width / @frameCount
    @height = @spriteImageScaled.height

  _scaleImage: (name) ->
    image = document.createElement("canvas")
    image.width = Math.ceil @[name].width * @scale
    image.height = Math.ceil @[name].height * @scale
    ctx = image.getContext("2d")
    ctx.save()
    ctx.scale @scale, @scale
    ctx.drawImage @[name], 0, 0
    ctx.restore()
    @["#{name}Scaled"] = image

  # events
  
  destroy: =>
    @vector = @vector?.unmake()
    @reversedVector = @reversedVector?.unmake()
    super
