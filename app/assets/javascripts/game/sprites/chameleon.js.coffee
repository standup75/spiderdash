class swGame.Chameleon extends swGame.SpriteInsidePath
  "use strict"
  spriteImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/chameleon.png"
  eyeImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/chameleon_eye.png"
  
  # see sprite.js.coffee to see how the settings are working
  settings:
    # number of points killing it is worth
    value: 300
  # determine size of the leaf (in pixel)
  width: 136
  height: 74
  randomMoveFactor: 40
  yOffset: 22
  tongueLastStep: 40
  tongueStuckLast: 40
  exp: 1.3
  # where the tongue is going
  halfHeight: null
  halfWidth: null
  target: null
  tongueStep: null
  isFiring: null
  tongueStuck: null

  # Sprite interface

  postInit: ->
    super
    @subscribe "branchIsDying", @mayDie
    @halfHeight = Math.round @height / 2
    @halfWidth = Math.round @width / 2

  move: -> @_lookForPlayer()

  redraw: ->
    super
    yOffset = if Math.round(Math.random() * @randomMoveFactor) then 0 else @height
    if @globals.isOnPill
      yOffset += 2 * @height
    else if @target
      if @target.y < @location.y
        yOffset = 4 * @height
      else
        yOffset = 5 * @height
    # draw tongue
    @fireTongue() if @target and not @globals.isOnPill
    # draw animal
    @ctx.drawImage @spriteImage, 0, yOffset, @width, @height, @location.x - @halfWidth, @location.y + @yOffset - @halfHeight, @width, @height
    # draw eye
    @ctx.drawImage @eyeImage, 0, 0, @eyeImage.width, @eyeImage.height, @_getEyeOffsetX(), @_getEyeOffsetY(), @eyeImage.width, @eyeImage.height

  # SpriteInsidePath interface

  getRect: -> swGame.Segment.make([@location.x - @halfWidth, @location.y + @yOffset - @halfHeight], [@location.x + @halfWidth, @location.y + @yOffset + @halfHeight])

  # private methods

  _getEyeOffsetX: ->
    @location.x - @halfWidth + 98 + (if @getPlayerDotProduct(1, 0) > 0 then 2 else -2)

  _getEyeOffsetY: ->
    @location.y - @halfHeight + @yOffset + 16 + (if @getPlayerDotProduct(0, 1) > 0 then 2 else -2)

  fireTongue: ->
    @_drawTongue()
    if @step == @tongueLastStep
      @_collision()
    else
      @step += if @isFiring then 1 else -2
    @target = @target.unmake() if @step <= 0
    #@_initTarget(@location.x + ~~(Math.random() * (swGame.globals.width - @location.x)), ~~(Math.random() * swGame.globals.height)) if @step <= 0

  _collision: ->
    if @globals.drawingPath and @globals.drawingPath.contains(@target, true)
      pubsub.publish("collision")
    else
      if (@tongueStuck == 0 and @target.isInsidePath(@globals.path)) or @tongueStuck++ == @tongueStuckLast
        @isFiring = false
        @step--

  _drawTongue: ->
    x = @location.x - @halfWidth + 110
    y = @location.y - @halfHeight + @yOffset + 24
    sign = if @target.y < @location.y then -1 else 1
    @ctx.save()
    @ctx.strokeStyle = "de87d5"
    @ctx.lineWidth = 8
    @ctx.lineCap = "round"
    @ctx.beginPath()
    @ctx.moveTo x, y
    @ctx.quadraticCurveTo x + @step, y + sign * @step, @_getTongueX(x), @_getTongueY(y)
    @ctx.stroke()
    @ctx.restore()

  _getTongueX: (x) -> x + Math.round (Math.pow(@exp, @step) * (@target.x - x)) / Math.pow(@exp, @tongueLastStep)
  _getTongueY: (y) -> y + Math.round (Math.pow(@exp, @step) * (@target.y - y)) / Math.pow(@exp, @tongueLastStep)

  _initTarget: (x, y) ->
    @target = swGame.Point.make x, y
    @tongueStep = 0
    @step = 0
    @tongueStuck = 0
    @isFiring = true

  _lookForPlayer: ->
    if not @target and not @globals.isOnPill\
    and @globals.player and @globals.player.x > @location.x\
    and @globals.drawingPath and @globals.drawingPath.length() > 0
      seg = swGame.Segment.make @location, @globals.player
      @_initTarget(@globals.player.x, @globals.player.y) if not seg.crossesPath @globals.path, true
      seg = seg.unmake()

  # events

  mayDie: (branch) => @die() if branch.ends.contains @location

  destroy: =>
    @target = @target?.unmake()
    super
