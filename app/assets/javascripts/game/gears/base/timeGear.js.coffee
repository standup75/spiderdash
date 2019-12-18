class swGame.TimeGear extends swGame.Gear
  "use strict"
  settings:
    duration: 10000

  redraw: (frameNumber) ->
    super
    if @sprite
      time = new Date().getTime()
      endTime = @sprite.getGearEndTime @name
      if time>endTime
        @unmake()
      else if @mustDisplayCountDown
        secLeft = Math.round (endTime - time)/1000
        swGame.gearUi.drawSec(@spriteImage, @imageHeight, @imageWidth, secLeft, @name) if secLeft isnt @secLeft
        @secLeft = secLeft
    
  # Events
  
  destroy: =>
    @sprite?.deleteGearEndTime @name
    swGame.gearUi.remove @name
    @unsubscribe "pause"
    @unsubscribe "resume"
    super
  
  pause: =>
    @pauseTime = new Date().getTime()
    
  resume: =>
    timeDiff = new Date().getTime() - @pauseTime
    @sprite?.setGearEndTime @name, timeDiff
    
          
  # methods
    
  dress: (sprite) ->
    if sprite.getGearEndTime @name
      @unmake()
    else
      super
      @subscribe "pause", @pause
      @subscribe "resume", @resume
      @mustDisplayCountDown = sprite.name == "Player"
    sprite.setGearEndTime @name, @duration
