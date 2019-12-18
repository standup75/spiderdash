class swGame.Roach extends swGame.Monster
  "use strict"
  spriteImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/roach.png"
  spriteBlueImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/roach_blue.png"
  frameDurationAlive: 3
  # see sprite.js.coffee to see how the settings are working
  settings:
    # 1 for clockwise, -1 for counter clockwise
    clockwise: -1
    # number of points killing it is worth
    value: 150
    # number of pixel/frame for the monster
    speed: 16
    # pause length
    pauseLength: 10
    # avg waiting time (avg number of refresh before the roach stops)
    wait: 300
  isInPause: 0
  wantToPause: false

  postInit: ->
    @isInPause = 0
    @wantToPause = false
    super

  move: ->
    if @wantToPause and not @isTurning
      @wantToPause = false
      @_pause()
    else
      if not Math.floor(Math.random() * @wait) or @isInPause > 0
        @_planPause()
      else
        @moveOnPath()

  _pause: ->
    if @isInPause++ > @pauseLength
      @isInPause = 0
      @_uTurn() if @getPlayerDotProduct(@sign.x, @sign.y) < 0

  _planPause: ->
    if @isTurning
      @wantToPause = true
    else
      @_pause()

  _uTurn: ->
    @clockwise = -@clockwise
    @directionOnPath = -@directionOnPath
    @pathIndex = @getNextPathIndex()
    @nextPos = @path.get @pathIndex
    @updateSign()
    @moveOnPath()
