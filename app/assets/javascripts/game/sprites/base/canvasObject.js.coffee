class swGame.CanvasObject extends swGame.Module

  # Canvas object life cycle:
  # init() -> loading images -> _init() -> postInit()
  # sprite lives: repaint() ->
  # -> unmake() -> destroy()

  "use strict"
  @extend swGame.PoolFactory
  @include swGame.Subscriptions
  globals: swGame.globals

  circleColor: "#dd310a"
  circleFrame: 0
  circleFrameCount: 20
  canvas: null
  ctx: null
  location: null
  # define the number of frames in the sprite animation
  frameCount: 3
  # define the number of cycle for each frame
  frameDuration: 10
  # used to calculate the current frame
  switchSprite: 0

  # interface

  redraw: (frameNumber) ->
  postInit: ->
  getRect: ->

  getPlayerDotProduct: (x, y)->
    return 0 if not @globals.player
    toPlayer = swGame.Point.make @globals.player.x - @location.x, @globals.player.y - @location.y
    vector = swGame.Point.make x, y
    dotProduct = toPlayer.dotProduct vector
    toPlayer = toPlayer.unmake()
    vector = vector.unmake()
    dotProduct

  drawFirst: -> @subscribe "levelReady", @reSubscribeToRepaint

  # Constructor
    
  init: (settings) ->
    @switchSprite = Math.floor(Math.random() * @frameCount * @frameDuration)
    # customize sprite's settings
    _settings = swGame.helpers.extend {}, @settings
    swGame.helpers.extend _settings, settings
    @[option] = _settings[option] for option of _settings
    @speed = Math.round((@speed * @level_speed) / 100) if @level_speed and @speed?
    # set location
    @location = swGame.Point.make(@x, @y).round() if @x and @y
    # init instance variables
    @ctx = @globals.ctx
    @canvas = @globals.canvas
    # check for the images to be loaded
    if swGame.images.ready
      @_init()
    else
      @subscribe "imagesLoaded", @_init  

  _init: =>
    @circleFrame = 0
    # init subscriptions
    @subscribe "repaint", @repaint
    # we have to do that because the fat arrow does not work inside a module (here: poolFactory)
    @subscribe "killSprites", => @unmake()
    @subscribe "circle#{@name}", @circle
    # sprite specific inits
    @postInit()

  # Destructor

  reSubscribeToRepaint: =>
    @unsubscribe "repaint"
    @subscribe "repaint", @repaint

  destroy: =>
    @location = @location?.unmake()
    @unsubscribe()

  # Events

  repaint: =>
    @redraw(0) unless @frameCount
    @switchSprite = (@switchSprite + 1) % (@frameCount * @frameDuration)
    @redraw Math.floor(@switchSprite / @frameDuration)

  circle: =>
    halfway = @circleFrameCount / 2
    color = if (@circleFrame % (halfway)) > @circleFrameCount / 4 then "f7f124" else @circleColor
    rect = @getRect()
    @ctx.save()
    @ctx.strokeStyle = @circleColor
    @ctx.lineWidth = 6
    scale = if @circleFrame >= halfway then @circleFrameCount - @circleFrame else @circleFrame
    w = Math.round 1.8 * (rect.p2.x - rect.p1.x) + scale * 2
    h = Math.round 1.8 * (rect.p2.y - rect.p1.y) + scale * 2
    x = Math.round (rect.p2.x - rect.p1.x - w) / 2 + rect.p1.x
    y = Math.round (rect.p2.y - rect.p1.y - h) / 2 + rect.p1.y
    swGame.helpers.drawEllipse @ctx, x, y, w, h
    @ctx.restore()
    @circleFrame = (@circleFrame + 1) % @circleFrameCount
