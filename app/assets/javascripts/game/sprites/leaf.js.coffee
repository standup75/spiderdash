class swGame.Leaf extends swGame.SpriteInsidePath
  "use strict"
  spriteImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/leaf.png"
  spriteDiesImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/leaf_dies.png"
  spriteBlueImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/leaf_blue.png"
  spriteDiesBlueImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/leaf_dies_blue.png"
  
  # see sprite.js.coffee to see how the settings are working
  settings:
    # number of points killing it is worth
    value: 0
    # where the leaf should be on the branch in percent, if false, it will be randomly placed
    placement: false
    # if true: @sign, @threshold and @maxAngleDiff will be chosen at random
    randomWind: true
    # determine direction of the wind
    sign: 1
    # determine speed of the sprite
    speed: 14
    # gravity (100 is max)
    gravity: 15
    # determine how much the ennemy will rotate
    p1: 1.2
    # determine how fast the ennemy can change direction
    p2: 25

  # image with the frames to be displayed when the sprite dies
  spriteDiesFrameCount: 10
  spriteDiesCycleCountPerFrame: 1

  # instance objects
  # cannot by initialized here
  # See http://html5stars.com/?p=148
  vector: null
  # determine size of the leaf (in pixel)
  width: 46
  height: 94
  # --- defined during init ---
  # segment's start point where the leaf falls from on the startPath
  startPoint: null
  # range of possible start locations on the startPath
  startRange: null
  # initial rotation angle
  rotationAngle: null
  # number of cycle left during blooming
  bloomingCyclesLeft: null
  # the branch is the ennemy, not the leaves
  isEnemy: false

  # Sprite interface

  move: ->
    if not @isBlooming
      @_rotateVector()
      @_updateLocation()
  
  redraw: ->
    super
    if @isBlooming
      @_redrawForBlooming()
    else
      @_redrawForFlying()
    @startPoint?.toString()

  postInit: ->
    super
    @lastRun = false
    @unsubscribe "pathUpdated"
    @subscribe "branchIsDying", @mayDie
    @subscribe "branchLocation", @branchFound
    @subscribe "updateBranchSize", @newStartPoint
    @vector = swGame.Point.make()

  dead: ->
    if @lastRun
      @unmake()
    else
      @_initLocation()
      @_initState()
      @_initWind()

  getRect: (scale = 0.7) ->
    h = Math.round @height * scale / 2
    w = Math.round @width * scale / 2
    swGame.Segment.make([@location.x - w, @location.y - h], [@location.x + w, @location.y + h])

  # private methods

  _redrawForBlooming: ->
    if --@bloomingCyclesLeft > 0
      @drawDyingSprite @bloomingCyclesLeft
    else
      @isBlooming = false
      @_redrawForFlying()

  _redrawForFlying: ->
    image = if @globals.isOnPill then @spriteBlueImage else @spriteImage
    @ctx.save()
    @ctx.translate @location.x, @location.y
    @ctx.rotate @rotationAngle
    @ctx.drawImage image, 0, 0, @width, @height, Math.round(-@width / 2), Math.round(-@height / 2), @width, @height
    @ctx.restore()

  _rotateVector: ->
    # rotate
    @rotationAngle += @maxAngleDiff * @sign if @location.y > @height
    # correction on the angle to avoid spinning around
    if @rotationAngle > @threshold or @rotationAngle < -@threshold
      @sign = -@sign
    seg = swGame.Segment.make([0,0], [0,1]).rotate(@rotationAngle)
    @vector.x = seg.p2.x - seg.p1.x
    @vector.y = seg.p2.y - seg.p1.y + @gravity / 100
    seg = seg.unmake()
    @vector.normalize()

  _updateLocation: ->
    anticipatedLocation = swGame.Point.make Math.round(@location.x + @speed * @vector.x), Math.round(@location.y + @speed * @vector.y)
    if @location.isInsidePath @globals.path
      @location.unmake()
      @location = anticipatedLocation
    else
      anticipatedLocation = anticipatedLocation.unmake()
      @isDying = true
      @switchSprite = 0

  _initLocation: ->
    percent = if @placement is false then Math.random() else @placement / 100
    @location.x = Math.round @startRange * percent + @startPoint.x + @width / 2
    @location.y = Math.round @startPoint.y + @height

  _initState: ->
    @rotationAngle = 0
    @isBlooming = true
    @switchSprite = 0
    @bloomingCyclesLeft = @spriteDiesFrameCount * @spriteDiesCycleCountPerFrame
    @isDying = false
    @vector.x = 0
    @vector.y = 1

  _initWind: ->
    if @randomWind
      @sign = if Math.random() < 0.5 then -1 else 1
      @threshold = Math.PI / (1 + Math.random() * @p1)
      @maxAngleDiff = Math.PI / ((1 + Math.random()) * @p2)

  # events
  
  branchFound: (branch) =>
    if branch.ends.contains @location
      @unsubscribe "branchLocation"
      @startPoint = branch.ends.p1.getCopy()
      @startRange = branch.ends.p2.x - branch.ends.p1.x - @width
      @_initLocation()
      @_initState()
      @_initWind()

  destroy: =>
    @vector = @vector?.unmake()
    @startPoint = @startPoint?.unmake()
    super

  mayDie: (branch) =>
    # leaf dies if it's the branch it sits on
    @lastRun = true if branch.ends.contains @startPoint

  newStartPoint: (freeBranchSegment) =>
    # first check it's the right branch
    if @startPoint.y == freeBranchSegment.p1.y and @startPoint.x <= freeBranchSegment.p1.x and @startPoint.x + @startRange >= freeBranchSegment.p1.x
      if freeBranchSegment.horizontalSize() < swGame.Branch.minWidth
        @lastRun = true
      else
        @startPoint = freeBranchSegment.p1.getCopy()
        @startRange = freeBranchSegment.p2.x - freeBranchSegment.p1.x - @width
