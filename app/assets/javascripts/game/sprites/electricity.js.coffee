class swGame.Electricity extends swGame.SpriteInsidePath
  "use strict"
  spriteImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/electricity.png"
  spriteBlueImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/electricity_blue.png"
  lineHImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/electric_line_h.png"
  lineVImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/electric_line_v.png"
  zImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/electric_z.png"

  # see sprite.js.coffee to see how the settings are working
  settings:
    # number of points killing it is worth
    value: 100

  # determine size of the electricity (in pixel)
  height: 22
  # will be defined during init:
  width: null
  # segment of the path where the electricity is anchored
  pathSegment: null

  # Sprite interface
    
  postInit: ->
    super
    scale = 1
    path =  @globals.path
    while true
      rect = @_getHeadRect @location, scale++
      cross = rect.getIntersection path, true
      rect = rect.unmake()
      break if cross
    cross.intersection = cross.intersection.unmake()
    @pathSegment = swGame.Segment.make path.get(cross.index), path.get(path.getNextIndex(cross.index))
    @orientation = @_getOrientation()
    @location.unmake()
    @location = @pathSegment.p1.getCopy()
    @width = Math.abs @pathSegment.p2.x - @location.x + @pathSegment.p2.y - @location.y
    @lineLength = @width - @spriteImage.width

  redraw: ->
    pubsub.publish("collision") if @hitPath(@globals.drawingPath) isnt false
    if not @isDying
      @_drawLine()
      @_drawPolls()
      @_collision() if @globals.player

  # SpriteInsidePath interface

  getRect: -> swGame.Segment.make @pathSegment.p1, @pathSegment.p2

  # private methods

  _drawPolls: ->
      image = if @globals.isOnPill then @spriteBlueImage else @spriteImage
      width = Math.round(image.width / 2)
      height = image.height
      @ctx.save()
      @ctx.translate @location.x, @location.y
      @ctx.rotate (Math.PI * @orientation) / 2
      @ctx.drawImage image, width, 0, width, height, -width, -height, width, height
      @ctx.translate -@width, 0
      @ctx.drawImage image, 0, 0, width, height, 0, -height, width, height
      @ctx.restore()

  _drawLine: ->
    zLocation = Math.round Math.random() * @lineLength-@zImage.width
    if @pathSegment.isHorizontal()
      if @orientation is 0
        x = Math.round(@pathSegment.p2.x + @spriteImage.width / 2)
        y = @pathSegment.p2.y - 18
      else
        x = Math.round(@location.x + @spriteImage.width / 2)
        y = @pathSegment.p2.y + 10
      @ctx.drawImage @lineHImage, 0, 0, 1, @lineHImage.height, x, y, @lineLength, @lineHImage.height
      if not @globals.isOnPill
        @ctx.drawImage @zImage, 0, 0, @zImage.width, @zImage.height, x+zLocation, y, @zImage.width, @zImage.height
    else
      if @orientation is 3
        x = @location.x - 18
        y = Math.round(@location.y + @spriteImage.width / 2)
      else
        x = @pathSegment.p2.x + 10
        y = Math.round(@pathSegment.p2.y + @spriteImage.width / 2)
      @ctx.drawImage @lineVImage, 0, 0, @lineVImage.width, 1, x, y, @lineVImage.width, @lineLength
      if not @globals.isOnPill
        @ctx.drawImage @zImage, 0, 0, @zImage.width, @zImage.height, x, y+zLocation, @zImage.width, @zImage.height

  _getHeadRect: (location, scale) ->
    scale or= 1
    swGame.Segment.make([location.x - 20 * scale, location.y - 20 * scale], [location.x + 20 * scale, location.y + 20 * scale])

  getDyingSpriteLocation: ->
    if @pathSegment.isHorizontal()
      x = Math.round Math.min(@location.x, @pathSegment.p2.x) + (@lineLength - @spriteDiesWidth) / 2
      y = @location.y
    else
      x = @location.x
      y = Math.round Math.min(@location.y, @pathSegment.p2.y) + (@lineLength - @spriteDiesHeight) / 2
    [x, y]

  _getOrientation: ->
    if @pathSegment.isVertical()
      if @pathSegment.p1.x <= @location.x
        1
      else
        3
    else
      if @pathSegment.p1.y <= @location.y
        2
      else
        0

  _killOrDie: ->
    if @globals.isOnPill
      @die()
    else
      pubsub.publish("collision")

  _isBetween: (val, b1, b2) ->
    min = Math.min b1, b2
    max = Math.max b1, b2
    val >= min and val <= max

  # events

  _collision: =>
    if (@_isBetween(@globals.player.x, @location.x, @pathSegment.p2.x) and\
    @_isBetween(@globals.player.y, @location.y - @globals.playerSpeed, @location.y + @globals.playerSpeed))\
    or (@_isBetween(@globals.player.y, @location.y, @pathSegment.p2.y) and\
    @_isBetween(@globals.player.x, @location.x - @globals.playerSpeed, @location.x + @globals.playerSpeed))
      @_killOrDie()

  killMeMaybe: =>
    isInside = @globals.path.contains(@location, true) and @globals.path.contains(@pathSegment.p2, true)
    @die() unless @isDying or isInside

  destroy: =>
    @pathSegment = @pathSegment?.unmake()
    super
