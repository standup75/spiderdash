class swGame.Monster extends swGame.SpriteOnPath
  "use strict"
  spriteImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/monster.png"

  # see sprite.js.coffee to see how the settings are working
  settings:
    # 1 for clockwise, -1 for counter clockwise
    clockwise: 1
    # number of points killing it is worth
    value: 25
    # number of pixel/frame for the monster
    speed: 6

  directionOnPath: null
  sign: null
  isTurning: false
  # the index in path the monster is heading to
  pathIndex: null
  # used in passive move to check when we arrive at the end of a segment from the path and need to change direction
  nextPos: null
  # coordinate of the player on the board
  location: null
  isDying: false
  # define the number of frames in the sprite animation
  frameCount: 2
  frameDuration: 3

  postInit: ->
    @clockwise = +@clockwise
    @directionOnPath = @clockwise
    @isTurning = false
    @width = @spriteImage.width / @frameCount
    @height = @spriteImage.height / 2
    @subscribe "pathUpdated", @killMeMaybe
    @subscribe "playerMoved", @collision
    @subscribe "prePathUpdated", @killIfOnTheWeb
    super

  redraw: (spriteIndexX) ->
    image = if @globals.isOnPill then @spriteBlueImage else @spriteImage
    xSrc = @width * spriteIndexX
    ySrc = if @clockwise is 1 then @height else 0
    @ctx.save()
    shiftX = if @clockwise is 1 then -@width else 0
    @translateAndRotate()
    @ctx.drawImage image, xSrc, ySrc, @width, @height, shiftX, -@height, @width, @height
    @ctx.restore()

  # Events

  killIfOnTheWeb: (path) =>
    # very special case where if the monster is on the corner between the new web and the path
    # it slips outside the path, we kill the monster here if we find it on the path to solve this
    @die() if path.contains @location, true
    false


  killMeMaybe: =>
    return if @isDying
    @path = @globals.path
    # on which segment is the monster on this new path?
    index = @path.length()
    nextIndex = 0
    monsterFound = false
    segment = swGame.Segment.make()
    while index-- and not monsterFound
      currentPt = @path.get(index)
      nextPt = @path.get(nextIndex)
      segment.init currentPt, nextPt
      if segment.contains @location
        if (nextPt.x > currentPt.x and @sign.x > 0)\
        or (nextPt.y > currentPt.y and @sign.y > 0)\
        or (nextPt.x < currentPt.x and @sign.x < 0)\
        or (nextPt.y < currentPt.y and @sign.y < 0)
          @pathIndex = nextIndex
          @directionOnPath = 1
          @nextPos = nextPt
        else
          @pathIndex = index
          @directionOnPath = -1
          @nextPos = currentPt
        monsterFound = true
      nextIndex = index
    segment = segment.unmake()
    @updateSign()
    @die() if not monsterFound

  collision: (player) =>
    return if @isDying
    monsterRect = @getRect()
    playerRect = player.getRect()
    if monsterRect.crossesRectAsRect(playerRect)
      if @globals.isOnPill
        @die()
      else
        pubsub.publish "collision"
    monsterRect = monsterRect.unmake()
    playerRect = playerRect.unmake()
