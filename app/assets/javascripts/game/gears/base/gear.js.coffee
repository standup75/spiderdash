class swGame.Gear extends swGame.Sprite
  "use strict"
  sprite: null
  spriteImage: null
  location: null
  exoskelton: null
  imageWidth: 0
  imageHeight: 0
  isDying: false
  bounce: true
  amplitude: 10
  frameCount: 1
  isEnemy: false
  step: 0
  circleColor: "#31dd0a"
  
  # Gear interface
  
  activateGear: ->
    # do something

  deactivateGear: ->
    # do something

  preDrawFilter: -> @unmake() if @isDying
  
  # Sprite interface
  
  postInit: ->
    @step = Math.random()
    @sprite = null
    @isDying = false
    @imageHeight = @spriteImage.height
    @imageWidth = @spriteImage.width/@frameCount
    @initExoskelton()
    @subscribeBoardEvent()

  redraw: (frameNumber) ->
    @preDrawFilter()
    # not @sprites means that the gear is still on the board
    if @exoskelton and not @sprite
      xDest = @exoskelton[0].x
      if @bounce
        yDest = @_getBouncedY()
        @step = (@step + 0.03) % 2
      else
        yDest = @exoskelton[0].y
      @ctx.drawImage @spriteImage, @imageWidth * frameNumber, 0, @imageWidth, @imageHeight, xDest, yDest, @imageWidth, @imageHeight

  getRect: ->
    return unless @exoskelton.length
    x = @exoskelton[0].x
    y = @_getBouncedY()
    swGame.Segment.make [x, y], [x + @imageWidth, y + @imageHeight]

  _getBouncedY: -> Math.round @exoskelton[0].y + @amplitude * (0.5 + Math.sin @step * Math.PI)
    
  # Events
  
  destroy: =>
    if @sprite
      @deactivateGear()
    else
      @removeGearFromBoard()
    @destroyExoskelton()
    super

  destroyExoskelton: -> pt.unmake() for pt in @exoskelton if @exoskelton

  mayKillGear: =>
    if not @location.isInsidePath(@globals.path)
      @isDying = true 
      pubsub.publish "playFx", "boom"


  mayCatchGear: (sprite) =>
    gearLocation = @exoskelton?[0]
    if gearLocation and not @isDying and sprite.location.isInsideRect gearLocation.x, gearLocation.y, gearLocation.x+@imageWidth, gearLocation.y+@imageHeight
      @removeGearFromBoard()
      @dress sprite
          
  # methods

  subscribeBoardEvent: ->
    @subscribe "pathUpdated", @mayKillGear
    @subscribe "mayCatchGear", @mayCatchGear

  initExoskelton: ->
    x = @location.x
    y = @location.y
    @exoskelton = [
      swGame.Point.make Math.round(x-@imageWidth/2), Math.round(y-@imageHeight/2)
      swGame.Point.make Math.round(x+@imageWidth/2), Math.round(y-@imageHeight/2)
      swGame.Point.make Math.round(x+@imageWidth/2), Math.round(y+@imageHeight/2)
      swGame.Point.make Math.round(x-@imageWidth/2), Math.round(y+@imageHeight/2)
    ]
  
  removeGearFromBoard: ->
    @unsubscribe "pathUpdated"
    @unsubscribe "mayCatchGear"
    
  dress: (sprite)->
    @sprite = sprite
    @activateGear()

