class swGame.RedStar extends swGame.Star
  "use strict"
  spriteImage: swGame.images.add "#{swGame.settings.assetsPath}/gears/RedStar.png"
  otherImage: swGame.images.add "#{swGame.settings.assetsPath}/gears/RedStar_action.png"
  otherFrameCount: 9
  frameDuration: 3
  postInit: ->
    pubsub.subscribe "destroysWeb", @destroysWeb
    super
  destroy: =>
    pubsub.unsubscribe "destroysWeb", @destroysWeb
    super
  _switchImages: ->
    @_switch "spriteImage", "otherImage"
    @_switch "frameCount", "otherFrameCount"
    @imageHeight = @spriteImage.height
    @imageWidth = @spriteImage.width/@frameCount
    @destroyExoskelton()
    @initExoskelton()
  _switch: (obj1, obj2) ->
    tmp = @[obj2]
    @[obj2] = @[obj1]
    @[obj1] = tmp
  destroysWeb: (path) =>
    rect = @getRect()
    res = rect.p1.isInsidePath(path) or rect.p2.isInsidePath(path)
    @_switchImages() if res
    rect = rect.unmake()
    res
  redraw: (frameNumber) =>
    super
    # check if active anim is finished
    @_switchImages() if frameNumber is @frameCount - 1


