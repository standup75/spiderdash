class swGame.Centipede extends swGame.SpriteInsidePath
  "use strict"
  spriteImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/centipede.png"
  podSpriteImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/centipede_pods.png"
  spriteBlueImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/centipede_blue.png"
  podSpriteBlueImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/centipede_pods_blue.png"
  
  # see sprite.js.coffee to see how the settings are working
  settings:
    # determine speed of the sprite
    speed: 16
    # number of points killing it is worth
    value: 100
    # determine how much the ennemy will rotate
    threshold: Math.PI/16
    # determine how fast the ennemy can change direction
    maxAngleDiff: Math.PI/5
    # determine how big is the ennemy (number of segment)
    podCount: 25
  
  # instance objects
  # cannot by initialized here
  # See http://html5stars.com/?p=148
  bufferedPods: null
  # determine size of the ennemy (in pixel)
  podWidth: 87
  podHeight: 48
  # number of sprites for the animation of the pods
  spriteNumber: 12
  # incremented %spriteNumber at every repaint to animate the pods
  spriteShift: 0
  # initial rotation angle
  rotationAngle: 0
  # counter to display the points for a certain amount of cycles (time)
  showPointCounter: 0

  # Sprite interface
    
  postInit: ->
    super
    # initial position
    @bufferedPods = [swGame.Point.make(@location.x, @location.y)]
    @bufferedPods.push @location
    @move() for i in [1..@podCount]

  # SpriteInsidePath interface

  move: ->
    #profile = swGame.profiler.start "centipede move"
    @movePods()
    @_updateBufferedPods()
    #profile?.stop()
  
  redraw: ->
    #profile = swGame.profiler.start "centipede repaint"
    super
    # draw
    if @bufferedPods.length == @podCount
      @spriteShift = (@spriteNumber+@spriteShift-1)%@spriteNumber
      podCount=0
      while podCount!=@podCount
        pt = @bufferedPods[podCount]
        if podCount==@podCount-1
          @ctx.drawImage @_getSpriteImage(), @spriteShift*@podWidth, 0, @podWidth, @podHeight, pt.x, pt.y, @podWidth, @podHeight
        else 
          @ctx.drawImage @_getPodImage(), ((podCount+@spriteShift)%@spriteNumber)*@podWidth, 0, @podWidth, @podHeight, pt.x, pt.y, @podWidth, @podHeight
        podCount++
      #@getRect @location
    #profile?.stop()

  getRect: ->
    maxX = maxY = minX = minY = 0
    for pt in @bufferedPods
      minX = pt.x if not minX or pt.x<minX
      minY = pt.y if not minY or pt.y<minY
      maxX = pt.x if pt.x>maxX
      maxY = pt.y if pt.y>maxY
    maxX += @podWidth
    maxY += @podHeight
    #@ctx.strokeRect minX, minY, maxX-minX, maxY-minY
    swGame.Segment.make [minX, minY], [maxX, maxY]

  getExoskelton: ->
    oneForth = Math.round(@podCount / 4)
    return false if @bufferedPods.length < @podCount
    [@bufferedPods[0].getCopy(), \
    @bufferedPods[oneForth].getCopy(), \
    @bufferedPods[2 * oneForth].getCopy(), \
    @location.getCopy(), \
    swGame.Point.make(@location.x + @podWidth, @location.y + @podHeight), \
    swGame.Point.make(@bufferedPods[2 * oneForth].x + @podWidth, @bufferedPods[2 * oneForth].y + @podHeight), \
    swGame.Point.make(@bufferedPods[oneForth].x + @podWidth, @bufferedPods[oneForth].y + @podHeight), \
    swGame.Point.make(@bufferedPods[0].x + @podWidth, @bufferedPods[0].y + @podHeight)]
      
  movePods: ->
    newPos = @_getNewPos @_updateVector()
    if (intersection = @_findIntersectionOrMove newPos) isnt false
      newPos.unmake()
      newPos = @_bounceVector intersection
      @_goBack() if (@_findIntersectionOrMove newPos) isnt false
    newPos.unmake()

  # private functions

  _getSpriteImage: -> if @globals.isOnPill then @spriteBlueImage else @spriteImage
  _getPodImage: -> if @globals.isOnPill then @podSpriteBlueImage else @podSpriteImage

  _getHeadRect: (location) ->
    swGame.Segment.make [location.x, location.y], [location.x + @podWidth, location.y + @podHeight]
  
  _updateBufferedPods: ->
    @bufferedPods.push @location
    @bufferedPods.shift().unmake() if @bufferedPods.length > @podCount

  _getNewPos: (vector) ->
    swGame.Point.make @location.x + vector.x * @speed, @location.y + vector.y * @speed

  _updateVector: ->
    # rotation angle
    @rotationAngle += 2 * (Math.random() - 0.5) * @maxAngleDiff
    # correction on the angle to avoid spinning around
    if @rotationAngle > @threshold
      @rotationAngle -= @maxAngleDiff 
    else if @rotationAngle <- @threshold
      @rotationAngle += @maxAngleDiff
    @_getVector().rotate(@rotationAngle)
    
  _bounceVector: (intersection) ->
    v = @_getVector()
    path = @globals.path
    nextIndex = (intersection + 1) % path.length()
    pathPt1 = path.get intersection
    pathPt2 = path.get nextIndex
    # is it bouncing on an horizontal plan or vertical?
    if pathPt1.x is pathPt2.x
      # vertical
      v.x = -v.x
    else
      # horizontal
      v.y = -v.y
    @_getNewPos v
    
  _findIntersectionOrMove: (newPos) ->
    rect = @_getHeadRect newPos
    intersectionPathIndex = @globals.path.crossesRect rect, true
    rect = rect.unmake()
    if intersectionPathIndex is false
      @location = newPos.getCopy().round()
      false
    else
      intersectionPathIndex
    
  _getVector: ->
    pod = @bufferedPods[@bufferedPods.length - 2]
    vectorX = @location.x - pod.x
    vectorY = @location.y - pod.y
    vectorX = 1 if not vectorX and not vectorY
    vectorLength = Math.sqrt(vectorX * vectorX + vectorY * vectorY)
    swGame.Point.make vectorX / vectorLength, vectorY / vectorLength
  
  _goBack: ->
    pod = @bufferedPods[@bufferedPods.length-2]
    @location = pod.getCopy()

  # events
  
  destroy: =>
    @location = null # no need to unmake because it has a reference inside the bufferedPods
    @bufferedPods.shift().unmake() while @bufferedPods?.length
    super
