class swGame.Arrow extends swGame.CanvasObject
  "use strict"
  arrow: swGame.images.add "#{swGame.settings.assetsPath}/sprites/arrows.png"
  arrowSmall: swGame.images.add "#{swGame.settings.assetsPath}/sprites/arrows-small.png"
  frameCount: 2
  arrowSize: 64
  arrowSmallSize: 30
  settings:
    direction: null # swGame.Point as direction of the arrow
    initTotalCycleCount: 10 # number of frame for the init where the arrow is bigger
  cycleCount: 0

  init: ->
    @cycleCount = 0
    super

  redraw: (frameNumber) ->
    if @cycleCount++ < @initTotalCycleCount
      xSrc = @arrowSize * (1 + @direction.x)
      ySrc = @arrowSize * (1 + @direction.y)
      xDest = @location.x - Math.round(@arrowSize / 2)
      yDest = @location.y - Math.round(@arrowSize / 2)
      @ctx.drawImage @arrow, xSrc, ySrc, @arrowSize, @arrowSize, xDest, yDest, @arrowSize, @arrowSize
    else
      xSrc = 2 * @arrowSmallSize * (1 + @direction.x)
      ySrc = @arrowSmallSize * (1 + @direction.y)
      xDest = @location.x - Math.round(@arrowSmallSize / 2)
      yDest = @location.y - Math.round(@arrowSmallSize / 2)
      xSrc += @arrowSmallSize if frameNumber is 1
      @ctx.drawImage @arrowSmall, xSrc, ySrc, @arrowSmallSize, @arrowSmallSize, xDest, yDest, @arrowSmallSize, @arrowSmallSize

  destroy: =>
    @direction = @direction?.unmake()
    super
