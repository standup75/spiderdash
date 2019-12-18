class swGame.Fire extends swGame.Gear
  "use strict"
  starCount = 0
  bounce: false
  frameDuration: 3
  frameCount: 13
  simpleFrameCount: 6
  totalFrameCount: 13
  spriteImage: swGame.images.add "#{swGame.settings.assetsPath}/gears/Fire.png"
  circleColor: "#dd310a"
  postInit: ->
    @frameCount = @totalFrameCount
    super
    @frameCount = @simpleFrameCount
    pubsub.subscribe "destroysWeb", @destroysWeb
  destroy: =>
    pubsub.unsubscribe "destroysWeb", @destroysWeb
    super
  activateGear: ->
    @sprite.die() unless @sprite.protection > 0 or @sprite.freeze
    @sprite = null
    @subscribeBoardEvent()
  destroysWeb: (path) =>
    rect = @getRect()
    res = rect.p1.isInsidePath(path) or rect.p2.isInsidePath(path)
    if res
      @frameCount = @totalFrameCount
      @switchSprite = 5
    rect = rect.unmake()
    res
  redraw: (frameNumber) =>
    super
    # check if active anim is finished
    if frameNumber is @totalFrameCount - 1
      @frameCount = @simpleFrameCount
      @switchSprite = 0
  # redefine exoskelton, because the glowing of the fire make the sprite too big
  initExoskelton: ->
    x = @location.x
    y = @location.y
    w = 50
    h = 56
    @exoskelton = [
      swGame.Point.make Math.round(x - w / 2), Math.round(y - h / 2)
      swGame.Point.make Math.round(x + w / 2), Math.round(y - h / 2)
      swGame.Point.make Math.round(x + w / 2), Math.round(y + h / 2)
      swGame.Point.make Math.round(x - w / 2), Math.round(y + h / 2)
    ]
