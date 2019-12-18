class swGame.WorldPlayer extends swGame.Sprite
  "use strict"
  spriteImage: swGame.images.add "#{swGame.settings.assetsPath}/player/spider.png"
  @include swGame.Spider
  settings: null
  speed: 20
  # for the "fall" animation
  angle: 0
  scale: 1
  # information related to the image/sprite
  # determine size of the player (in pixel)
  width: 90
  height: 64
  totalFrameCount: 10 # this includes the "yeah" animation
  # number of sprites for the animation of the player
  frameCountInit: 5
  frameCount: 5
  # Speed at which we switch between the sprite.
  # The greater the number is, the faster we will switch between sprites
  frameDuration: 3
  stampHisFeetFrequency: 4
  cycle: 0
  # path to reach the level
  goals: null
  goalsReached: 0

  # Sprite interface
  postInit: ->
    @initSpider()
    @subscribe "pause", @cancelMove
    @unsubscribe "killSprites"
    @subscribe "showHome", @deactivate
    @cycle = 0
    @_initNextCycle()
  
  redraw: (frameNumber) ->
    if @goals
      @cycle = 0
      goalLocation = @goals[@goalsReached]
      if @location.x == goalLocation.x and @location.y == goalLocation.y
        if @goalsReached == @goals.length - 1
          if @mustFall and not @canCatchMustache
            @_fall(frameNumber)
          else
            swGame.mustache.catchMustache() if @canCatchMustache
            @_removeGoals()
            @_drawSpider frameNumber
          return
        @goalsReached++
      @_move() if not @freeze
    else
      # Let the spider stamps his feet sometimes...
      frameNumber = @_checkForAnimation frameNumber

    @_drawSpider frameNumber

  # private functions

  _checkForAnimation: (frameNumber) ->
    if @switchSprite is 0
      @cycle++ 
      if @cycle is (@nextCycle + 1)
        @_initNextCycle()
      else if @cycle > @nextCycle
        @cycle = 0  
    if @cycle is @nextCycle
      frameNumber 
    else
      0

  _initNextCycle: -> @nextCycle = Math.ceil(Math.random() * @stampHisFeetFrequency)
  
  _move: ->
    goalLocation = @goals[@goalsReached]
    stepLeft = Math.max Math.abs(goalLocation.x - @location.x), Math.abs(goalLocation.y - @location.y)
    if goalLocation.x != @location.x
      stepSize = (goalLocation.x - @location.x) / stepLeft
      @location.x += stepSize * @speed
      @location.x = goalLocation.x if @location.x * stepSize > goalLocation.x * stepSize
    if goalLocation.y != @location.y
      stepSize = (goalLocation.y - @location.y) / stepLeft
      @location.y += stepSize * @speed
      @location.y = goalLocation.y if @location.y * stepSize > goalLocation.y * stepSize
    
  _fall: (frameNumber) ->
    pubsub.publish("playFx", "fall") if @angle is 0
    @angle += 10
    @scale -= 1/36
    if @angle == 360
      @deactivate()
      swGame.world.gotoLevel()
    else
      @ctx.save()
      @ctx.translate @location.x, @location.y
      @ctx.rotate (4 * @angle * Math.PI) / 360
      @ctx.scale @scale, @scale
      @ctx.drawImage @spriteImage, @getSpiderXSrc(frameNumber), 0, @width, @height, Math.round(-@width * @scale / 2), Math.round(-@height * @scale / 2), @width, @height
      @ctx.restore()

  _drawSpider: (frameNumber) ->
    xDest = Math.round @location.x - @width / 2
    yDest = Math.round @location.y - @height / 2
    @ctx.drawImage @spriteImage, @getSpiderXSrc(frameNumber), 0, @width, @height, xDest, yDest, @width, @height

  deactivate: =>
    @unsubscribe "repaint"
    @angle = 0
    @scale = 1
    @_removeGoals()

  _removeGoals: ->
    if @goals
      pt.unmake for pt in @goals
      @goals = null

  reactivate: ->
    @freeze = false
    @subscribe "repaint", @repaint

  setGoalAndFall: (goalArray, isWorldEnd) ->
    @canCatchMustache = @_canCatchMustache isWorldEnd
    @mustFall = true
    @_setGoal goalArray

  setGoal: (goalArray, isWorldEnd) ->
    @canCatchMustache = @_canCatchMustache isWorldEnd
    @mustFall = false
    @_setGoal goalArray

  _setGoal: (goalArray) ->
    @_removeGoals()
    @goals = goalArray
    @goalsReached = 0

  _canCatchMustache: (isWorldEnd) ->
    isWorldEnd and not swGame.profile.hasMustache(swGame.world.getWorldIndex())