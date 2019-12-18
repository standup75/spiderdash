class swGame.Fruits extends swGame.Gear
  "use strict"
  order = ""
  spriteImage: swGame.images.add "#{swGame.settings.assetsPath}/gears/Fruits.png"
  height: 70
  width: 70
  spriteDiesFrameCount: 0
  frameCount: 7
  settings:
    index: 0
    value: 100

  postInit: ->
    super
    order = ""
    @path = new swGame.Path @exoskelton

  redraw: ->
    # not @sprites means that the gear is still on the board
    if @exoskelton and not @sprite and @_isVisible()
      xDest = @exoskelton[0].x
      if @bounce
        yDest = Math.round @exoskelton[0].y + @amplitude * (0.5 + Math.sin @step * Math.PI)
        @step = (@step + 0.03) % 2
      else
        yDest = @exoskelton[0].y
      @ctx.drawImage @spriteImage, @imageWidth * @index, 0, @imageWidth, @imageHeight, xDest, yDest, @imageWidth, @imageHeight

  mayCatchGear: (sprite) =>
    if @_isVisible()
      gearLocation = @exoskelton?[0]
      rect = swGame.Segment.make sprite.location, [sprite.location.x + sprite.podWidth, sprite.location.y + sprite.podHeight]
      #console.log @index, rect.toString(), @path.toString()
      if gearLocation and not @isDying and @path.crossesRect(rect)
        pubsub.publish "secretPoints", @value
        order += @index
        @die()
        swGame.levelBonus.showSecret(sprite.points) if order.length is 7 or (order.length is 6 and order isnt "012345")

      rect = rect.unmake()

  _isVisible: -> @index < 6 or order == "012345" # only display the banana if all other fruits have been eaten in ms pacaman order (sick!)

  getDyingSpriteLocation: ->
    [Math.round(@location.x-@width/2), Math.round(@location.y-@height/2)]
