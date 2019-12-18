class swGame.LadybugTest extends swGame.Monster
  "use strict"
  spriteImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/ladybug.png"
  spriteBlueImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/ladybug_blue.png"
  frameDurationAlive: 3

  postInit: ->
    super
    @free = true
    @hasDrawnWeb = false

  move: ->
    @free = false if @isTurning and not @hasDrawnWeb
    if @free
      super

  killMeMaybe: =>
    @free = true
    @hasDrawnWeb = true
    #@isTurning = false
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
        if (nextPt.x>currentPt.x and @sign.x>0)\
        or (nextPt.y>currentPt.y and @sign.y>0)\
        or (nextPt.x<currentPt.x and @sign.x<0)\
        or (nextPt.y<currentPt.y and @sign.y<0)
          @pathIndex = nextIndex
          @directionOnPath = 1
          @nextPos = nextPt
        else
          @pathIndex = index
          @directionOnPath = -1
          @nextPos = currentPt
        monsterFound = true
        debugger
      nextIndex = index
    segment = segment.unmake()

  collision: =>