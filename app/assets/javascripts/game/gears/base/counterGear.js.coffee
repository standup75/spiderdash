class swGame.CounterGear extends swGame.Gear
  "use strict"
  settings:
    counter: 10
  currentCount: 0

  redraw: (frameNumber) ->
    super
    if @sprite
      turnLeft = @counter - @currentCount
      if turnLeft != @turnLeft
        swGame.gearUi.drawCount(@spriteImage, @imageHeight, @imageWidth, turnLeft + 1, @name) 
        @turnLeft = turnLeft
    
  activateGear: -> @unmake() if @currentCount++ is @counter

  # methods
  
  destroy: =>
    swGame.gearUi.remove(@name) if @sprite
    super
    
  dress: (sprite) ->
    @currentCount = 0
    @turnLeft = -1
    super
