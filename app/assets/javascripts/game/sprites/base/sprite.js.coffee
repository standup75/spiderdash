class swGame.Sprite extends swGame.CanvasObject

  # the Sprite class instantiates canvasObjects that can move and collide 

  # Sprite life cycle:
  # init() -> loading images -> _init() -> postInit() for sprite specific inits ->
  # sprite lives: repaint() calls move() and redraw() ->
  # die() -> sprite is dying -> dead() -> unmake() (except for swGame.Player) -> destroy()

  "use strict"
  # settings that can be overriden in the CMS.
  # These are the default values
  # setting's properties become instance's properties after init
  # for example: @settings.value becomes @value
  settings:
    # determine speed of the sprite
    speed: 10
    # number of points killing it is worth
    value: 0

  # image with the frames to be displayed when the sprite dies
  spriteDiesImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/sprite_dies.png"
  spriteDiesFrameCount: 6
  spriteDiesCycleCountPerFrame: 5
  # if the ennemy is killed during the dying animation, this should be set to true
  isDying: false
  isEnemy: true
  freeze: false

  # interface
  
  move: ->
    # implement me
  
  redraw: (frameNumber) ->
    # implement me

  postInit: (frameNumber) ->
    # implement me

  # default getRect

  getRect: (scale = 1) ->
    h = Math.round @height * scale / 2
    w = Math.round @width * scale / 2
    swGame.Segment.make([@location.x - w, @location.y - h], [@location.x + w, @location.y + h])

  # Some helpers
  
  # created this alias so that we can override it and do something if the sprite need to live after death (player has several lives)
  dead: ->
    @unmake()
  
  displayScore: (score, x, y, color) ->
    @ctx.fillStyle = color
    @ctx.font = "bold 40px Courier"
    @ctx.fillText "" + score, x, y
    @ctx.strokeStyle = "#000"
    @ctx.strokeText "" + score, x, y

  getPlayerDotProduct: (x, y)->
    return 0 if not @globals.player
    toPlayer = swGame.Point.make @globals.player.x - @location.x, @globals.player.y - @location.y
    vector = swGame.Point.make x, y
    dotProduct = toPlayer.dotProduct vector
    toPlayer = toPlayer.unmake()
    vector = vector.unmake()
    dotProduct
  
  die: ->
    return if @isDying
    pubsub.publish "someoneJustDied", @
    pubsub.publish "playFx", "boom"
    @isDying = true
    @switchSprite = 0

  # Constructor
    
  init: (settings) ->
    swGame.level.addEnemy() if @isEnemy
    @isDying = false
    @freeze = false
    super

  _init: =>
    # init subscriptions
    @subscribe "freeze", @freezeUp
    @subscribe "move", @defrost
    # dying sprite size
    @spriteDiesHeight = @spriteDiesImage.height/@spriteDiesFrameCount
    @spriteDiesWidth = @spriteDiesImage.width
    super

  getDyingSpriteLocation: ->
    [Math.round(@location.x - @spriteDiesWidth / 2), Math.round(@location.y - @spriteDiesHeight / 2)]

  drawDyingSprite: (switchSprite) ->
    ySrc = switchSprite * @spriteDiesHeight
    image = if @globals.isOnPill and @spriteDiesBlueImage then @spriteDiesBlueImage else @spriteDiesImage
    if @rotationAngle?
      @ctx.save()
      @ctx.translate @location.x, @location.y
      @ctx.rotate @rotationAngle
      @ctx.drawImage image, 0, ySrc, @spriteDiesWidth, @spriteDiesHeight, -Math.round(@spriteDiesWidth / 2), -Math.round(@spriteDiesHeight / 2), @spriteDiesWidth, @spriteDiesHeight
      @ctx.restore()
    else
      [xDest, yDest] = @getDyingSpriteLocation()
      @ctx.drawImage image, 0, ySrc, @spriteDiesWidth, @spriteDiesHeight, xDest, yDest, @spriteDiesWidth, @spriteDiesHeight

  _sanityCheck: ->
    if @location.x <= 0 or @location.y <= 0 or @location.x >= swGame.globals.width or @location.y >= swGame.globals.height
      console.error "a sprite is gone", @
      console.log("#{key}: #{@[key].toString()}") for key of @
      console.log "player's position: #{@globals.player.toString()}"
      @isDying = true


  # Destructor

  freezeUp: => @freeze = true

  defrost: => @freeze = false

  # Events

  repaint: =>
    if @isDying
      dyingFrameCount = @spriteDiesFrameCount * @spriteDiesCycleCountPerFrame
      # death
      if @switchSprite < dyingFrameCount
        @drawDyingSprite Math.floor(@switchSprite / @spriteDiesCycleCountPerFrame)
        @switchSprite++
      # points
      else if @switchSprite < (dyingFrameCount + 25) and @value
        [xDest, yDest] = @getDyingSpriteLocation()
        scoreCycle = @switchSprite-dyingFrameCount
        opacity = 1 - scoreCycle / 25
        @displayScore @value, xDest, yDest - scoreCycle / 2, "rgba(236, 255, 0, #{opacity})"
        @switchSprite++
      # delete sprite
      else
        @dead()
      # resuscitate
      if @switchSprite == dyingFrameCount and @canResuscitate and not @freeze
        pubsub.publish("duplicateSprite", @name, @settings) 
        @canResuscitate = false
    else
      @_sanityCheck() # if there is a bug... I have seen some....
      @switchSprite = if @frameCount then (@switchSprite + 1) % (@frameCount * @frameDuration) else 0
      @move() if not @freeze
      @redraw Math.floor(@switchSprite / @frameDuration)
      pubsub.publish "mayCatchGear", @ if @canWearGears
