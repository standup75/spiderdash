class swGame.Stopngo extends swGame.CounterGear
  "use strict"
  spriteImage: swGame.images.add "#{swGame.settings.assetsPath}/gears/Stopngo.png"
  repaintCount: 10
  repaintCounter: 0
  isRunning: true
  isActive: false
  arrows: null
  init: ->
    @isRunning = true
    @isActive = false
    super
  removeGearFromBoard: ->
    super
    @subscribe "pathUpdated", @unmake
  redraw: ->
    super
    if @isActive and @isRunning and @repaintCounter++ == @repaintCount
      @activateGear()
  activateGear: ->
    @isRunning = false
    if @isActive
      @subscribeBoardEvent()
    else
      @isActive = true
    @subscribe "touch", @deactivateGear
    @subscribe "turn", @deactivateGear
    pubsub.publish "freeze"
    width = @sprite[if @sprite.direction.x is 0 then "height" else "width"]
    height = @sprite[if @sprite.direction.y is 0 then "height" else "width"]
    x = @sprite.location.x
    y = @sprite.location.y
    @_createArrows x, y, width, height
    super

  # events

  destroy: =>
    @unsubscribe "pathUpdated"
    super
  deactivateGear: =>
    @isRunning = true
    @repaintCounter = 0
    @unsubscribe "touch"
    @unsubscribe "turn"
    pubsub.publish "move"
    @_destroyArrows()

  # private

  _destroyArrows: ->
    if @arrows
      arrow.unmake() for arrow in @arrows
      @arrows = null
  _createArrows: (x, y, width, height) ->
    @arrows = [
      swGame.Arrow.make x: x - width, y: y, direction: swGame.Point.make(-1, 0), initTotalCycleCount: 0
      swGame.Arrow.make x: x + width, y: y, direction: swGame.Point.make(1, 0), initTotalCycleCount: 0
      swGame.Arrow.make x: x, y: y - height, direction: swGame.Point.make(0, -1), initTotalCycleCount: 0
      swGame.Arrow.make x: x, y: y + height, direction: swGame.Point.make(0, 1), initTotalCycleCount: 0
    ]
