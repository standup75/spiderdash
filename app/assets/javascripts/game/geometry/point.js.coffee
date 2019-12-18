class swGame.Point extends swGame.Module
  @extend swGame.PoolFactory
  "use strict"
  x: 0
  y: 0
    
  init: (x, y) ->
    return if x is undefined
    if typeof x isnt "number" or typeof y isnt "number"
      console.trace()
      throw "swGame.Point: init point with pt.init(x, y)"
    @x = x
    @y = y
    @
  
  # returns 1 if the point (this) is after the point (as param)
  # returns -1 if he's before, 0 if they're equal
  directionTo: (point) ->
    x = if point.x < @x then 1 else if point.x > @x then -1 else 0
    y = if point.y < @y then 1 else if point.y > @y then -1 else 0
    swGame.Point.make x, y
    
  equal: (point) ->
    if point
      @x is point.x and @y is point.y
    else
      false

  getCopy: ->
    swGame.Point.make @x, @y
    
  round: ->
    @x = Math.round @x
    @y = Math.round @y
    @
    
  # returns true if the point (this) is inside the rectangle
  isInsideRect: (x1, y1, x2, y2) ->
    @x>=x1 and @y>=y1 and @x<=x2 and @y<=y2

  normalize: ->
    vectorLength = Math.sqrt(@x*@x+@y*@y)
    @x = @x/vectorLength
    @y = @y/vectorLength
    
  # returns true if the point (this) is inside the path given as param
  isInsidePath: (path) ->
    path = path.path if path.path
#    console.log "------------------"+JSON.stringify(path)
#    console.trace()
    horizontalSegment = swGame.Segment.make [@x, @y], [-6, @y]
    pathLength = path.length
    return 0 if pathLength<4
    index = pathLength-1
    nextPoint = path[0]
    nextNextPoint = path[1]
    currentPoint = path[index]
    prevPoint = path[index-1]
    crossed = 0
    currentSegment = swGame.Segment.make()
    crossedSegment = swGame.Segment.make()
    while index-- > -1
      unless currentPoint.equal nextPoint
        currentSegment.init currentPoint, nextPoint
        # we need to ignore the case where the point is ON a segment of the path
        return 0 if currentSegment.contains(@)
        # look at where the intersection with the segment is, inc crossed if found
        crossedSegment.init prevPoint, nextNextPoint
        intersection = horizontalSegment.crossesSegment currentSegment, crossedSegment
        if intersection
          crossed++
          intersection = intersection.unmake()
      nextNextPoint = nextPoint
      nextPoint = currentPoint
      currentPoint = prevPoint
      prevPoint = if index>0 then path[index-1] else path[pathLength+index-1]
    # odd => contains the point
    currentSegment = currentSegment.unmake()
    horizontalSegment = horizontalSegment.unmake()
    crossedSegment = crossedSegment.unmake()
    crossed%2 

  rotate: (angle) ->
    @x= @x*Math.cos(angle) - @y*Math.sin(angle)
    @y= @x*Math.sin(angle) + @y*Math.cos(angle)
    @
  
  toString: ->
    "point: x="+@x+" - y="+@y
  draw: (ctx) ->
    ctx.strokeStyle = "aaaaee"
    ctx.lineWidth = 2
    ctx.lineCap = "square"
    ctx.beginPath()
    ctx.arc(@x-1, @y-1, 2, 0, Math.PI*2, true)
    ctx.closePath()
    ctx.stroke()
  
  perpDotProduct: (pt) -> @x * pt.y - @y * pt.x
  dotProduct: (pt) -> @x * pt.x + @y * pt.y
  sizeAsVector: -> Math.sqrt(@x * @x + @y * @y)
