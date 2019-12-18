class swGame.Player extends swGame.SpriteOnPath
  "use strict"
  @include swGame.gearable
  @include swGame.Spider
  settings:
    speed: 12
  # 1 for clockwise, -1 for counter clockwise
  directionOnPath: 1
  # number of pixel/frame for the player
  path: null
  # information related to the image/sprite
  # determine size of the player (in pixel)
  width: 0
  height: 0
  # Speed at which we switch between the sprite.
  # The greater the number is, the faster we will switch between sprites
  frameDuration: 3
  # the index in path the player is heading to
  pathIndex: 1
  # used in active move when resolving the path to remember where the player is coming from
  previousPathIndex: 0
  # used in active move to remember the path the player is drawing
  drawingPath: null
  # if not null => active move, contains the (almost) normalized vector of the player's direction    
  direction: null
  # on touchScreen, this defines the size of the area to be touched to come back (as opposed to turning)
  comingBackFactor: 10
  # hide score and controls under the player depending on these locations
  scoreSizeX: 400
  scoreSizeY: 400
  controlSizeX: 400
  controlSizeY: 400
  # the arrow that shows up when the user plans to leave the path at the next corner
  arrow: null
  isEnemy: false
  spriteDiesFrameCount: 8
  spriteDiesCycleCountPerFrame: 3
  autoStep: 0
  # Sprite interface
    
  postInit: ->
    @initSpider()
    @globals.playerSpeed = @speed
    @directionOnPath = 1
    @clockwise = @directionOnPath
    @previousPathIndex = 0
    @pathIndex = 1
    @path = @globals.path
    @drawingPath = @globals.drawingPath
    @nextPos = @path.get 1
    @location = @path.getCopy(0) if not @location
    @sign = @_getDirection()
    @globals.player = @location
    @subscribe "turn", @turn
    @subscribe "touch", @touch
    @subscribe "newLife", @newLife
    @subscribe "collision", @die
    @subscribe "crouch", @orderCrouch
    @subscribe "levelCompleted", @levelCompleted
    @subscribe "changeMustache", @changeMustache
  
  move: ->
    return if @_isCrouched()
    if @direction
      #profile = swGame.profiler.start "player active move"
      @_activeMove()
      #profile?.stop()
    else
      #profile = swGame.profiler.start "player passive move"
      @_passiveMove()
      #profile?.stop()
      @_turnIfReachedArrow()
    @_fadeScoreOutOrIn()

  redraw: (frameNumber) ->
    @needRedraw = false
    profile = swGame.profiler.start "player redraw"
    @drawingPath.repaint(@location.getCopy()) if @drawingPath.length()
    @ctx.save()
    if @direction
      @_activeRedraw frameNumber
    else
      @_passiveRedraw frameNumber
    @ctx.restore()
    profile?.stop()

  # Sprite overload
  
  dead: ->
    @isDying = false
    @destroy()
    pubsub.publish "gameOver"

  getRect: ->
    adjust = if @isTurning then Math.cos(@getTurningAngle()) else 1
    switch @getPosition()
      when 0 then rect = swGame.Segment.make [@location.x - @width / 2 - @speed, @location.y - @height / 2], [@location.x + adjust * @width / 2, @location.y]
      when 1 then rect = swGame.Segment.make [@location.x, @location.y - @width / 2 - @speed], [@location.x + @height / 2, @location.y + adjust * @width / 2]
      when 2 then rect = swGame.Segment.make [@location.x - adjust * @width / 2 - @speed, @location.y], [@location.x + @width / 2, @location.y + @height / 2]
      when 3 then rect = swGame.Segment.make [@location.x - @height / 2, @location.y - adjust * @width / 2 - @speed], [@location.x, @location.y + @width / 2]
    @_clipWithCurrentSegment rect
    rect

  translateAndRotate: ->
    @ctx.translate @location.x, @location.y
    angle = @getPosition() * Math.PI / 2
    angle += @getTurningAngle() if @isTurning and not @_isCrouched()
    @ctx.rotate angle
    
  getTurningAngle: ->
    newNextPos = @path.get @getNextPathIndex()
    newSign = newNextPos.directionTo @location
    distanceToWall = Math.max Math.abs(@location.x-@nextPos.x), Math.abs(@location.y-@nextPos.y)
    addedAngle = Math.acos 2*distanceToWall/@width
    addedAngle *= @clockwise*@sign.x*newSign.y + @clockwise*@sign.y*newSign.x
    addedAngle = -addedAngle if (@clockwise is -1 and @sign.y is 0) or (@clockwise is 1 and @sign.x is 0)
    newSign = newSign.unmake()
    addedAngle


  # public functions

  getTouchDirection: (x, y) -> 
    if @direction
      @_touchInActiveMode x, y
    else
      @_touchInPassiveMode x, y

  drawDyingSprite: (frameNumber) -> @redraw frameNumber
    
  # private functions

  _getDirection: ->
    if @nextPos.equal @location
      @location.directionTo(@path.get @previousPathIndex)
    else
      @nextPos.directionTo @location


  _activeRedraw: (frameNumber) ->
    if @direction.y < 0
      angle = 0
    else if @direction.x > 0
      angle = 1
    else if @direction.y > 0
      angle = 2
    else 
      angle = 3
    @ctx.translate @location.x, @location.y
    @ctx.rotate angle * Math.PI / 2
    @ctx.drawImage @spriteImage, @getSpiderXSrc(frameNumber), 0, @width, @height, -Math.round(@width / 2), -Math.round(@height / 2), @width, @height

  _passiveRedraw: (frameNumber) ->
    @translateAndRotate()
    frameNumber = @_turningFrameNumber() if @currentState is "turning" or @currentState is "turningCc"
    @ctx.drawImage @spriteImage, @getSpiderXSrc(frameNumber), 0, @width, @height, -Math.round(@width / 2), -@height + 18, @width, @height
    @initSpriteState(@nextState) if @nextState and @switchSprite is @frameDuration * @frameCount - 1

  _turningFrameNumber: ->
    truncWidth = @_getTruncWidth()
    if truncWidth is @width
      @initSpriteState "passive"
      0
    else if truncWidth < @width
      halfWidth = @width / 2
      @frameCount - 1 - Math.max(0, Math.floor(@frameCount * (truncWidth - halfWidth) / halfWidth))

  _getTruncWidth: ->
    if @sign.x
      truncSegment = swGame.Segment.make [@location.x - @width / 2, 0], [@location.x + @width / 2, 0]
      @_clipWithCurrentSegment truncSegment
      truncWidth = truncSegment.horizontalSize()
    else
      truncSegment = swGame.Segment.make [0, @location.y - @width / 2], [0, @location.y + @width / 2]
      @_clipWithCurrentSegment truncSegment
      truncWidth = truncSegment.verticalSize()
    truncSegment = truncSegment.unmake()
    truncWidth

  _clipWithCurrentSegment: (rect) ->
    currentSegment = swGame.Segment.make @path.get(@previousPathIndex), @nextPos
    rect.clip currentSegment
    currentSegment = currentSegment.unmake()
    rect

  _fadeScoreOutOrIn: ->
    if @location.x < @scoreSizeX and @location.y < @scoreSizeY and (@location.x >= @scoreSizeX - @globals.playerSpeed or @location.y >= @scoreSizeY - @globals.playerSpeed)
      swGame.ui.hideScore()
    else if (@location.x > @scoreSizeX or @location.y > @scoreSizeY) and @location.x <= @scoreSizeX + @globals.playerSpeed and @location.y <= @scoreSizeY + @globals.playerSpeed
      swGame.ui.showScore()
    controlX = swGame.globals.width - @controlSizeX
    controlY = swGame.globals.height - @controlSizeY
    #console.log @location.x, controlX, @location.y, controlY, controlX + @globals.playerSpeed, controlY + @globals.playerSpeed
    if @location.x > controlX and @location.y > controlY and (@location.x <= controlX + @globals.playerSpeed or @location.y <= controlY + @globals.playerSpeed)
      swGame.ui.hideControls()
    else if (@location.x < controlX or @location.y < controlY) and @location.x >= controlX - @globals.playerSpeed and @location.y >= controlY - @globals.playerSpeed
      swGame.ui.showControls()
  
  _touchInPassiveMode: (x, y) ->
    overDiag1 = y >= (x - @location.x) + @location.y
    overDiag2 = y >= (@location.x - x) + @location.y
    if overDiag1
      if overDiag2
        swGame.Point.make 0, 1
      else
        swGame.Point.make -1, 0
    else
      if overDiag2
        swGame.Point.make 1, 0
      else
        swGame.Point.make 0, -1
  
  _touchInActiveMode: (x, y) ->
    if @direction.x
      overDiag1 = y >= (x - @location.x) / @comingBackFactor + @location.y
      overDiag2 = y >= (@location.x - x) / @comingBackFactor + @location.y
      if @direction.x is -1 and not overDiag1 and overDiag2
        swGame.Point.make 1, 0
      else if  @direction.x is 1 and overDiag1 and not overDiag2
        swGame.Point.make -1, 0
      else if y > @location.y
        swGame.Point.make 0, 1
      else
        swGame.Point.make 0, -1
    else
      overDiag1 = y >= (x - @location.x) * @comingBackFactor + @location.y
      overDiag2 = y >= (@location.x - x) * @comingBackFactor + @location.y
      if @direction.y is -1 and overDiag1 and overDiag2
        swGame.Point.make 0, 1
      else if  @direction.y is 1 and not overDiag1 and not overDiag2
        swGame.Point.make 0, -1
      else if x>@location.x
        swGame.Point.make 1, 0
      else
        swGame.Point.make -1, 0
    
  _checkCanSpinAtNextPos: (direction) ->
    anticipatedLocation = @nextPos.getCopy()
    anticipatedLocation.x += direction.x
    anticipatedLocation.y += direction.y
    res = anticipatedLocation.isInsidePath @path
    anticipatedLocation = anticipatedLocation.unmake()
    res
  
  _createArrow: (direction) ->
    @sign = @sign?.unmake()
    @sign = @_getDirection()
    if @sign.equal(direction) and @_checkCanSpinAtNextPos(direction)
      @arrow = swGame.Arrow.make x: @nextPos.x, y:@nextPos.y, direction: direction.getCopy()

  _turnIfReachedArrow: ->
    if @location.equal @arrow?.location
      @_changeDirection @arrow.direction
      @_removeArrow()

  _removeArrow: -> @arrow = @arrow?.unmake()

  _updateNextSegment: ->
    @isTurning = false
    @previousPathIndex = @pathIndex
    @pathIndex += @directionOnPath
    @pathIndex = @path.length()-1 if @pathIndex == -1
    @pathIndex = 0 if @pathIndex == @path.length()
    @nextPos = @path.get(@pathIndex)
    @checkIsInside()

  _passiveMove: ->
    # move the player's position
    @sign = @sign?.unmake()
    @sign = @_getDirection()
    @location.x += @globals.playerSpeed * @sign.x
    @location.y += @globals.playerSpeed * @sign.y
    # look up if the player is at the end of a segment
    if @sign.x * @location.x >= @sign.x * @nextPos.x and @sign.y * @location.y >= @sign.y * @nextPos.y
      @isTurning = false
      # adjust position (important only if @globals.playerSpeed>1)
      @location.x = @nextPos.x
      @location.y = @nextPos.y
      # go to the next segment
      @_updateNextSegment()
      @sign = @sign?.unmake()
      @sign = @_getDirection()
    if not @isTurning and @sign.x * @location.x + @width / 2 >= @sign.x * @nextPos.x and @sign.y * @location.y + @width / 2 >= @sign.y * @nextPos.y
      @isTurning = true
      if @clockwise is 1
        @initSpriteState "turning"
      else
        @initSpriteState "turningCc"
    # publish the fact that the player moved and give old and new position
    pubsub.publish "playerMoved", @
    
  # move outside the path, catching the ennemies!
  _activeMove: ->
    @location.x += @direction.x * @globals.playerSpeed
    @location.y += @direction.y * @globals.playerSpeed
    # create a segment representing the last move made by the player
    lastPosition = @drawingPath.get @drawingPath.length()-1
    # note: we need to add @direction so that the first move leaving the path is not seen as crossing the path
    lastMove = swGame.Segment.make [lastPosition.x+@direction.x, lastPosition.y+@direction.y], @location
    res = lastMove.getIntersection @path, true
    # check if the player is back on the path
    if res
      # correct the player's position to be on the path
      # (if @globals.playerSpeed is big, it could have gone a little too far...) 
      @location.x = res.intersection.x
      @location.y = res.intersection.y
      res.intersection = res.intersection.unmake()
      lastMove = lastMove.unmake()
      return @_resolvePath(res.index)
    lastMove = lastMove.unmake()
    
  # I haven't written such an ugly function in a long time
  _resolvePath: (landingSegmentIndex) ->
    pubsub.publish "stopFx", "threading"
    @initSpriteState "passive"
    # 1. init
    # high index of the landing segment in @path
    landingSegmentIndexHigh = @path.getNextIndex(landingSegmentIndex)
    # starting point of the landing segment
    currentPoint = @path.get(landingSegmentIndex)
    # end point of the landing segment
    nextPoint = @path.get(landingSegmentIndexHigh)
    # reset direction
    @direction = @direction?.unmake()
    # add current position to the drawing path
    if @drawingPath.get(0).equal @location
      @drawingPath.reset()
      return
    @drawingPath.push @location.x, @location.y

    # 2. cut out 2 paths

    minPathIndex = Math.min(@previousPathIndex, @pathIndex)
    maxPathIndex = Math.max(@previousPathIndex, @pathIndex)
    startsAndEndsOnOneSegment = Math.max(landingSegmentIndex, landingSegmentIndexHigh) == maxPathIndex \
    and Math.min(landingSegmentIndex, landingSegmentIndexHigh) == minPathIndex
    
    # if it's the last segment of the path, the opposite applies
    if minPathIndex == 0 and maxPathIndex != 1
      minPathIndex = maxPathIndex
      maxPathIndex = 0

    # At this point we have:
    # 0-----------------4---------1
    # |                 |         |
    # |                 |         |
    # |                 |         2---5-----3
    # |                 |             |     |
    # |                 ---------------     |
    # ...                                   ...
    # 0 = minPathIndex
    # 1 = maxPathIndex
    # 2 = landingSegmentIndex
    # 3 = landingSegmentIndexHigh
    # 4 = Where the player left the path and started the DrawingPath
    # 5 = Where the player lands back on the path, and where he is located at this moment (ie. when calling @_resolvePath)
    # The U between 4 and 5 represents the drawing path
    

    # don't slice the path if it ends by index 0
    closingEndPath = if landingSegmentIndexHigh then @path.path[landingSegmentIndexHigh..] else []
    closingStartPath = if maxPathIndex then @path.path[maxPathIndex..] else []

    # check if the @drawingPath starts and ends on the same segment of the @path
    if startsAndEndsOnOneSegment
      # check if we change direction
      extPath = closingStartPath.concat(@path.path[0..minPathIndex])
      intPath = []
      if !@drawingPath.isSameDirectionAsPath currentPoint.x<=nextPoint.x, currentPoint.y<=nextPoint.y
        # player went backward with the drawing path
        extPath.reverse()
    else if minPathIndex < landingSegmentIndex
        intPath = @path.path[maxPathIndex..landingSegmentIndex]
        extPath = closingEndPath.concat(@path.path[0..minPathIndex])
        intPath.reverse()
      else # minPathIndex > landingSegmentIndex
        intPath = @path.path[landingSegmentIndexHigh..minPathIndex]
        extPath = closingStartPath.concat(@path.path[0..landingSegmentIndex]).reverse()
    # find the smallest surface
    # make it so: intPathObj is the biggest surface, intPathObj the smallest
    intPath = intPath.concat @drawingPath.path
    extPath = extPath.concat @drawingPath.path
    intPathObj = new swGame.Path intPath
    extPathObj = new swGame.Path extPath
    # see if we need to switch
    intPathPx2 = intPathObj.calculatePx2()
    extPathPx2 = extPathObj.calculatePx2()
    if extPathPx2 > intPathPx2
      extPathObj.path = intPath
      intPathObj.path = extPath

    if not pubsub.findOrIgnore("destroysWeb", extPathObj) and Math.min(intPathPx2, extPathPx2) > 200 and extPathObj.closePath()
      pubsub.publish "prePathUpdated", extPathObj
      # restore position of the player on the new path
      closedPathCenterOfMass = extPathObj.getCenterOfMass()
      @directionOnPath = 1
      @path.getIntPathAndFreeExtPath intPathObj.path, extPathObj.path

      @path.simplify()
      @pathIndex = @path.length() - 1 # actually should be zero, but updateNextSegment will take care of this
      @drawingPath.path = [] # no reset here, the points have been recycled already!
      score = swGame.profile.getScore()
      pubsub.publish "pathUpdated", closedPathCenterOfMass
      @initSpriteState("yeah") if (score + 50) < swGame.profile.getScore()
      closedPathCenterOfMass = closedPathCenterOfMass.unmake()
      @_updateNextSegment()
      pubsub.publish "playFx", "web"
    else
      @previousPathIndex = landingSegmentIndex
      @pathIndex = landingSegmentIndexHigh
      @nextPos = @path.get(@pathIndex)
      @directionOnPath = if (landingSegmentIndex < landingSegmentIndexHigh) or (landingSegmentIndexHigh is 0) then 1 else -1
      @drawingPath.reset()
      @checkIsInside()

  _turn: (direction) ->
    return if @needRedraw or @isDying
    @needRedraw = true
    @_removeArrow()
    # see if the current position (@location) is before or after the last Point
    # in the @path (@nextPos) that the Player passed by
    xDir = direction.x
    yDir = direction.y
    # make sure we actually turn and we're going inside the path
    dir = @_getDirection()
    if @direction or (xDir * dir.x is 0 and yDir * dir.y is 0 and @_isGoingInsidePath(direction))
      @_changeDirection direction
    else if not @_isCrouched() and (@isTurning or (xDir * dir.x is 0 and yDir * dir.y is 0))
      @isTurning = false
      @initSpriteState "crouching"
    # check if we're in passive mode and we're changing direction
    else if not @direction and not @isTurning
      justUncrouched = @_isCrouched() and (xDir * dir.x isnt 0 or yDir * dir.y isnt 0)
      @initSpriteState "uncrouching" if justUncrouched
      if xDir * dir.x < 0 or yDir * dir.y < 0
        # we can change direction
        @directionOnPath = -@directionOnPath
        @clockwise = -@clockwise
        # redefine (invert) the next segment
        @_updateNextSegment()
      else if (xDir * dir.x > 0 or yDir * dir.y > 0) and not justUncrouched and not pubsub.findOrIgnore("cannotTurn")
        @_createArrow(direction)
    direction = direction.unmake()
    dir = dir.unmake()

  _isGoingInsidePath: (direction) ->
    anticipatedLocation = swGame.Point.make @location.x + (direction.x || 1), @location.y + (direction.y || 1)
    res = +anticipatedLocation.isInsidePath @path
    anticipatedLocation.init @location.x + (direction.x || -1), @location.y + (direction.y || -1)
    res += +anticipatedLocation.isInsidePath @path
    res is 2
  ###
  _isGoingInsidePath: (direction) ->
    anticipatedLocation = swGame.Point.make @location.x + (direction.x || 1), @location.y + (direction.y || 1)
    res = anticipatedLocation.isInsidePath @path
    unless res
      anticipatedLocation.init @location.x + (direction.x || -1), @location.y + (direction.y || -1)
      res = anticipatedLocation.isInsidePath @path
    if res
      anticipatedLocation.init @location.x - direction.x, @location.y - direction.y
      res = not anticipatedLocation.isInsidePath @path
    anticipatedLocation = anticipatedLocation.unmake()
    res
  ###

  _changeDirection: (newDir) ->
    if not @direction and pubsub.findOrIgnore("cannotTurn")
      @initSpriteState "passive"
    else
      @drawingPath.push @location.x, @location.y
      @initSpriteState "active"
      unless @direction?.equal newDir
        @direction?.unmake()
        @direction = newDir.getCopy()
        pubsub.publish "playFx", "threading"

  _isCrouched: -> @currentState is "crouching" or @currentState is "crouched"

  # Events

  destroy: =>
    pubsub.publish "stopFx", "threading"
    @direction = @direction?.unmake()
    super
  
  die: =>
    return if @isDying
    super
    @initSpriteState "dying"
    pubsub.publish "playFx", "lose"

  orderCrouch: =>
    unless @direction
      @initSpriteState "crouching"

  levelCompleted: =>
    @initSpriteState "yeah"
    # be horizontal
    if @sign.y
      @sign.y = 0
      @sign.x = 1
      @clockwise = -1

  changeMustache: (mustacheIndex) => @mustacheIndex = mustacheIndex

  turn: (x, y) => @_turn swGame.Point.make(x, y)
  touch: (x, y, isDoubleTap) =>
    return if swGame.gameManager.isPaused()
    if isDoubleTap and @turningFactor
      #newDirection = @direction.getCopy().rotate(Math.PI * @turningFactor / 2)
      newDirection = swGame.Point.make @direction.y * @turningFactor, @direction.x * @turningFactor
      console.log "@turningFactor: ", @turningFactor
      console.log "newDirection: ", newDirection
    else
      newDirection = @getTouchDirection x, y
      if @direction
        # +1 0 (this is @direction)
        #   0 -1 (this is newDirection) -> -1
        #   0 +1 -> +1
        # -1 0
        #   0 -1 -> +1
        #   0 +1 -> -1
        # 0 +1
        #   -1 0 -> +1
        #   +1 0 -> -1
        # 0 -1
        #   -1 0 -> -1
        #   +1 0 -> +1
        # -> (x - y)(x1 + y1)
        @turningFactor = -(@direction.x + @direction.y)*(newDirection.x + newDirection.y)

    @_turn newDirection
