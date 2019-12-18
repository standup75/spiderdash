class swGame._DeadlyPath extends swGame.Path
  staggering: 10
  fenceRandomness: 20
  constructor: (deadly_path) ->
    super(@_toArray deadly_path)
    @simplify()
    @path.push @path[0].getCopy()
    @_draw()

  _draw: ->
    @ctx.save()
    @ctx.strokeStyle = 'rgba(0, 0, 0, 0.4)'
    @ctx.lineWidth = 10
    @ctx.fillStyle = "#222"
    @drawAndFillPath()
    @_drawSpiral()
    @ctx.restore()

  dead: ->
    @ctx.save()
    @ctx.lineWidth = 0
    @ctx.fillStyle = "#888"
    @drawAndFillPath()
    @ctx.beginPath()
    @ctx.restore()

  drawPathInContext: ->
    xStart = @_getQuadraticEnd "x", 0
    yStart = @_getQuadraticEnd "y", 0
    @ctx.moveTo xStart, yStart
    index = 1
    while pt = @path[index]
      xEnd = @_getQuadraticStart "x", index
      yEnd = @_getQuadraticStart "y", index
      @ctx.lineTo xEnd, yEnd
      xStart = @_getQuadraticEnd "x", index
      yStart = @_getQuadraticEnd "y", index
      @ctx.quadraticCurveTo pt.x, pt.y, xStart, yStart
      index++

  _toArray: (xyHash) -> xyHash.map((xyValue) -> [xyValue.x, xyValue.y])

  _drawSpiral: ->
    # http://jsfiddle.net/jingshaochen/xJc7M/
    a = 3
    b = 3
    pt = @getCenterOfMass()
    @ctx.moveTo pt.x, pt.y
    @ctx.beginPath()
    i = 0
    while i < 2880
      angle = 0.2 * i
      x = pt.x + (a + b * angle) * Math.cos(angle)
      y = pt.y + (a + b * angle) * Math.sin(angle)
      @ctx.lineTo x, y
      i++
    @ctx.strokeStyle = "rgba(200, 200, 200, 0.5)"
    @ctx.lineWidth = 6
    @ctx.stroke()
    pt.unmake()

  _getQuadraticEnd: (xOrY, index) ->
    nextIndex = if @path[index + 1] then index + 1 else 1
    if @path[nextIndex][xOrY] is @path[index][xOrY]
      @path[index][xOrY]
    else if @path[nextIndex][xOrY] > @path[index][xOrY]
      @path[index][xOrY] + @staggering
    else # if @path[nextIndex][xOrY] < @path[index][xOrY]
      @path[index][xOrY] - @staggering

  _getQuadraticStart: (xOrY, index) ->
    previousIndex = index - 1
    if @path[index][xOrY] is @path[previousIndex][xOrY]
      @path[index][xOrY]
    else if @path[previousIndex][xOrY] > @path[index][xOrY]
      @path[index][xOrY] + @staggering
    else # if @path[previousIndex][xOrY] < @path[index][xOrY]
      @path[index][xOrY] - @staggering

class swGame.DeadlyZone extends swGame.SpriteInsidePath

  postInit: ->
    super
    @exoskelton = new swGame._DeadlyPath @deadly_path
    @value = Math.round @exoskelton.calculatePx2() / 400
    @location.unmake()
    @location = @exoskelton.getCenterOfMass()
    @subscribe "prePathUpdated", @showFilledUp

  getDyingSpriteLocation: -> [@location.x, @location.y]

  showFilledUp: (path) => @exoskelton.dead() if @location.isInsidePath(path)
 
  hitPath: (path) ->
    return false if not path or not path.length()
    path.crossesPath @exoskelton, false
