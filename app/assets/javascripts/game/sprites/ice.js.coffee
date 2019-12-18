class swGame.Ice extends swGame.SpriteInsidePath
  "use strict"
  spriteImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/ice.png"
  redlineImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/ice_redline.png"

  # see sprite.js.coffee to see how the settings are working
  settings:
    # number of points killing it is worth
    value: 60

  # determine size of the electricity (in pixel)
  height: 11
  # will be defined during init:
  width: null
  # segment of the path where the electricity is anchored
  pathSegment: null
  isDrawn: false
  opacityCycle: 0
  # not an enemy, so that it does not count towards massacre bonus
  isEnemy: false

  # Sprite interface
    
  postInit: ->
    super
    path =  @globals.path
    cross = @_findCloserSegment()
    @pathSegment = swGame.Segment.make path.get(cross), path.get(path.getNextIndex(cross))
    @orientation = @_getOrientation()
    @location.unmake()
    @location = @pathSegment.p1.getCopy()
    @width = Math.abs @pathSegment.p2.x - @location.x + @pathSegment.p2.y - @location.y
    @xSource = Math.round(Math.random() * (@spriteImage.width - @width))
    @subscribe "cannotTurn", @playerIsOnIceStrict
    @subscribe "destroysWeb", @playerIsOnIceStrict
    @_draw()
    @opacityCycle = 0

  redraw: ->
    pubsub.publish("collision") if @hitPath(@globals.drawingPath) isnt false
    @_redrawRedLine()

  _findCloserSegment: ->
    scale = 1
    while true
      rect = @_getHeadRect @location, scale++
      crosses = @globals.path.crossesRectMulti rect, true
      rect = rect.unmake()
      break if crosses
    if !crosses
      console.error "Ice could not find a wall: #{@}"
    for cross in crosses
      pt = @globals.path.get cross
      nextPt = @globals.path.get @globals.path.getNextIndex(cross)
      distance = Math.abs((pt.x + nextPt.x) / 2 - @location.x) + Math.abs((pt.y + nextPt.y) / 2 - @location.y)
      if not shorterDistance or distance < shorterDistance
        shorterDistance = distance
        bestCross = cross
    bestCross

  _draw: ->
    @_rotateAndDraw swGame.globals.ctxBackground, (ctx) =>
      ctx.drawImage @spriteImage, @xSource, 0, @width, @spriteImage.height, 0, 0, @width, @spriteImage.height

  _redrawRedLine: ->
    @needRedraw = false
    @_rotateAndDraw @ctx, (ctx) =>
      @opacityCycle += 1
      ctx.globalAlpha = (if @opacityCycle >= 20 then 40 - @opacityCycle else @opacityCycle) / 20
      @opacityCycle = 0 if @opacityCycle >= 40
      h = @redlineImage.height
      ctx.drawImage @redlineImage, @xSource, 0, @width, h, 0, @spriteImage.height - h, @width, h

  _rotateAndDraw: (ctx = @ctx, drawFct) ->
    ctx.save()
    switch @orientation
      when 0 then ctx.translate @location.x, @location.y - @spriteImage.height
      when 1 then ctx.translate @location.x + @spriteImage.height, @location.y
      when 2 then ctx.translate @location.x, @location.y + @spriteImage.height
      when 3 then ctx.translate @location.x - @spriteImage.height, @location.y
    ctx.rotate (Math.PI * @orientation)/2
    drawFct ctx
    ctx.restore()
    @isDrawn = true

  # Sprite overrides

  getDyingSpriteLocation: ->
    if @pathSegment.isHorizontal()
      x = Math.round Math.min(@location.x, @pathSegment.p2.x) + (@width - @spriteDiesWidth) / 2
      y = Math.round @location.y - @spriteDiesHeight / 2
    else
      x = Math.round @location.x - @spriteDiesWidth / 2
      y = Math.round Math.min(@location.y, @pathSegment.p2.y) + (@width - @spriteDiesHeight) / 2
    [x, y]

  # SpriteInsidePath interface

  getRect: -> swGame.Segment.make @pathSegment.p1, @pathSegment.p2

  # private methods

  _getHeadRect: (location, scale) ->
    scale or= 1
    swGame.Segment.make([location.x - 20 * scale, location.y - 20 * scale], [location.x + 20 * scale, location.y + 20 * scale])

  _getOrientation: ->
    if @pathSegment.isVertical()
      if @pathSegment.p1.x <= @location.x
        3
      else
        1
    else
      if @pathSegment.p1.y <= @location.y
        0
      else
        2

  # events

  killMeMaybe: =>
    isInside = @globals.path.contains(@location, true) and @globals.path.contains(@pathSegment.p2, true)
    @die() unless @isDying or isInside

  destroy: =>
    @pathSegment = @pathSegment?.unmake()
    super

  ###
  playerIsOnIce: =>
    playerLocation = @globals.player
    switch @orientation
      when 0 then playerLocation.y is @location.y and @location.x < playerLocation.x and @pathSegment.p2.x > playerLocation.x
      when 1 then playerLocation.x is @location.x and @location.y < playerLocation.y and @pathSegment.p2.y > playerLocation.y
      when 2 then playerLocation.y is @location.y and @location.x > playerLocation.x and @pathSegment.p2.x < playerLocation.x
      when 3 then playerLocation.x is @location.x and @location.y > playerLocation.y and @pathSegment.p2.y < playerLocation.y
  ###

  playerIsOnIceStrict: =>
    playerLocation = @globals.player
    switch @orientation
      when 0 then playerLocation.y is @location.y and @location.x <= playerLocation.x and @pathSegment.p2.x >= playerLocation.x
      when 1 then playerLocation.x is @location.x and @location.y <= playerLocation.y and @pathSegment.p2.y >= playerLocation.y
      when 2 then playerLocation.y is @location.y and @location.x >= playerLocation.x and @pathSegment.p2.x <= playerLocation.x
      when 3 then playerLocation.x is @location.x and @location.y >= playerLocation.y and @pathSegment.p2.y <= playerLocation.y
