class swGame.Segment extends swGame.Module
  @extend swGame.PoolFactory
  "use strict"
  p1: null,
  p2: null,
  
  minX: ->
    Math.min(@p1.x, @p2.x)
  minY: ->
    Math.min(@p1.y, @p2.y)
  maxX: ->
    Math.max(@p1.x, @p2.x)
  maxY: ->
    Math.max(@p1.y, @p2.y)
  round: ->
    @p1?.round()
    @p2?.round()
    @
  isHorizontal: -> @p1.y == @p2.y
  isVertical: -> @p1.x == @p2.x
  isParallel: (seg) -> (seg.isHorizontal() and @isHorizontal()) or (seg.isVertical() and @isVertical())
  isExtremity: (pt) -> pt.equal(@p1) or pt.equal(@p2)
  verticalSize: -> Math.abs(@p1.y-@p2.y)
  horizontalSize: -> Math.abs(@p1.x-@p2.x)
  center: -> swGame.Point.make Math.round((@p1.x + @p2.x) / 2), Math.round((@p1.y + @p2.y) / 2)

  # p1 and p2 are arrays such as: p1=[x, y], p2=[x, y]
  init: (p1, p2) ->
    @_unmakePoints()
    if p1? and p2?
      if not ((p1 instanceof swGame.Point or p1 instanceof Array) and (p2 instanceof swGame.Point or p2 instanceof Array))
        console.log @toString(), p1, p2
        throw "swGame.Segment: init segment with new seg.init([x1, y1], [x2, y2]) or seg.init(Point, Point)"
      @p1 = if p1 instanceof Array then swGame.Point.make p1[0], p1[1] else p1.getCopy()
      @p2 = if p2 instanceof Array then swGame.Point.make p2[0], p2[1] else p2.getCopy()
    @
  _unmakePoints: ->
    @p1 = @p1?.unmake()
    @p2 = @p2?.unmake()
  destroy: (leavePoints) ->
    debugger if leavePoints
    @_unmakePoints() unless leavePoints
  getCopy: ->
    swGame.Segment.make @p1, @p2
  equal: (seg) ->
    (seg.p1.equal(@p1) and seg.p2.equal(@p2)) or (seg.p1.equal(@p2) and seg.p2.equal(@p1))

  # check if the 2 segments (this and the segment parameter)
  # are crossing each other. If they do, returns the Point
  # of the intersection, false otherwise
  # http://en.wikipedia.org/wiki/Line-line_intersection
  # crossSegment is used for the edge case where segments are parallel
  
  crossesSegment: (segment, crossSegment) ->
#    console.log "is "+JSON.stringify(@)+" crossing "+JSON.stringify(segment)+" ?"
    result = false
    segmentFactor = (segment.p2.x - segment.p1.x) * (@p1.y - segment.p1.y) - (segment.p2.y - segment.p1.y) * (@p1.x - segment.p1.x)
    thisFactor = (@p2.x - @p1.x) * (@p1.y - segment.p1.y) - (@p2.y - @p1.y) * (@p1.x - segment.p1.x)
    denominator = (segment.p2.y - segment.p1.y) * (@p2.x - @p1.x) - (segment.p2.x - segment.p1.x) * (@p2.y - @p1.y)
    unless denominator is 0
      segmentFactor /= denominator
      thisFactor /= denominator
      if 0 <= segmentFactor and segmentFactor <= 1 and 0 <= thisFactor and thisFactor <= 1
        result = swGame.Point.make(Math.round(@p1.x + segmentFactor * (@p2.x - @p1.x)), Math.round(@p1.y + segmentFactor * (@p2.y - @p1.y)))
    else
      # segments are parallel
      if (not crossSegment or @_makesACross(crossSegment))\
      and (segmentFactor is 0 or thisFactor is 0)
        result = @_commonPointOnParallelSegments(segment)
    result    

  _makesACross: (segment) ->
    segment.minX()<=@maxX() and segment.maxX()>=@minX() and \
    segment.minY()<=@maxY() and segment.maxY()>=@minY()

  _commonPointOnParallelSegments: (segment) ->
    res = false
    if @isVertical()
      if segment.p1.y >= @minY() and segment.p1.y <= @maxY()
        res = segment.p1.getCopy()
      else if segment.p2.y >= @minY() and segment.p2.y <= @maxY()
        res = segment.p2.getCopy()
    else if @isHorizontal()
      if segment.p1.x >= @minX() and segment.p1.x <= @maxX()
        res = segment.p1.getCopy()
      else if segment.p2.x >= @minX() and segment.p2.x <= @maxX()
        res = segment.p2.getCopy()
    else if @_makesACross(segment)
      res = segment.p1.getCopy()
    res


  # if the segment (this) crosses the path, it returns an object containing
  # the intersection and the index in the index in the path of the segment
  # where the intersection occurs:
  # {intersection: swGame.Point, index: number}
  # if closePath = true: it is closing the path (joining the first and last point of the path)
  # returns false otherwise
  
  _crossesPath: (path, closePath, callback) ->
    pathLength = path.length-1
    nextPoint = if closePath then path[0] else null
    currentPoint = path[pathLength]
    return false if pathLength<1
    segmentFromPath = swGame.Segment.make()
    while pathLength-- > -1
      if nextPoint
        segmentFromPath.init currentPoint, nextPoint
        break if intersection = @crossesSegment segmentFromPath
      nextPoint = currentPoint
      currentPoint = path[pathLength]
    segmentFromPath = segmentFromPath.unmake()
    if intersection
      #console.log "intersection", @.toString(), segmentFromPath.toString(), intersection.toString(), @isParallel(segmentFromPath)
      callback(intersection, pathLength+1)
    else
      false
    
  crossesPath: (path, closePath) ->
    path = path.path if path.path
    @_crossesPath path, closePath, (intersection, index) ->
      intersection = intersection.unmake()
      true
  
  getIntersection: (path, closePath) ->
    path = path.path if path.path
    @_crossesPath path, closePath, (intersection, index) ->
      {intersection: intersection, index: index}

  crossesRect: (rect) ->
    if @isVertical()
      @p1.x>=rect.p1.x and @p1.x<=rect.p2.x and @maxY()>rect.minY() and @minY()<rect.maxY()
    else
      @p1.y>=rect.p1.y and @p1.y<=rect.p2.y and @maxX()>rect.minX() and @minX()<rect.maxX()

  crossesRectAsRect: (rect) ->
    ((@maxX() <= rect.maxX() and @maxX() >= rect.minX()) or (rect.maxX() <= @maxX() and rect.maxX() >= @minX()))\
    and ((@maxY() <= rect.maxY() and @maxY() >= rect.minY()) or (rect.maxY() <= @maxY() and rect.maxY() >= @minY()))

  crossesPathAsRect: (path) ->
    seg = swGame.Segment.make()
    
    unmake = ->
      seg = seg?.unmake()
      side.unmake for side in rect
    
    prevPt = path[path.length-1]
    
    rect = [swGame.Segment.make(@p1, [@p2.x, @p2.y]),\
    swGame.Segment.make([@p2.x, @p2.y], @p2),\
    swGame.Segment.make(@p2, [@p1.x, @p2.y]),\
    swGame.Segment.make([@p1.x, @p2.y], @p1)]
    
    for side in rect
      for pt in path
        seg.init prevPt, pt
        if side._makesACross seg
          unmake()
          return true
        prevPt = pt
    unmake()
    false
  
  # return the situation of p1 and p2: true means inside
  isInsidePath: (path) ->
    path = path.path if path.path
    @p1.isInsidePath(path) and @p2.isInsidePath(path) and not @crossesPath(path, true)
    
  contains: (point) ->
    (@p1.x is @p2.x and point.x is @p1.x and @minY() <= point.y and @maxY() >= point.y) or \
    (@p1.y is @p2.y and point.y is @p1.y and @minX() <= point.x and @maxX() >= point.x)
  
  rotate: (angle) ->
    @rotateAtOrigin angle, (@p1.x+@p2.x)/2, (@p1.y+@p2.y)/2
    
  rotateAtOrigin: (angle, originX, originY) ->
    x1 = @p1.x - originX
    x2 = @p2.x - originX
    y1 = @p1.y - originY
    y2 = @p2.y - originY
    @p1.x= x1*Math.cos(angle) - y1*Math.sin(angle) + originX
    @p1.y= x1*Math.sin(angle) + y1*Math.cos(angle) + originY
    @p2.x= x2*Math.cos(angle) - y2*Math.sin(angle) + originX
    @p2.y= x2*Math.sin(angle) + y2*Math.cos(angle) + originY
    @
    
  resize: (dimension) ->
    size = Math.sqrt((@p1.x - @p2.x) * (@p1.x - @p2.x) + (@p1.y - @p2.y) * (@p1.y - @p2.y))
    # x = D(xb-xa)/ab+xa
    x = Math.round(dimension * (@maxX() - @minX()) / size + @minX())
    # y = D(yb-ya)/ab+ya
    y = Math.round(dimension * (@maxY() - @minY()) / size + @minY())
#    console.log "------------------"
#    console.log "resize :", @p1.x, @p1.y, @p2.x, @p2.y, "size: ", Math.sqrt((@p1.x-@p2.x)*(@p1.x-@p2.x)+(@p1.y-@p2.y)*(@p1.y-@p2.y))
    if @maxX() is @p1.x
      @p1.x = x
    else
      @p2.x = x
    if @maxY() is @p1.y
      @p1.y = y
    else
      @p2.y = y
#    console.log "resize :", @p1.x, @p1.y, @p2.x, @p2.y, "size: ", Math.sqrt((@p1.x-@p2.x)*(@p1.x-@p2.x)+(@p1.y-@p2.y)*(@p1.y-@p2.y))
    @

  clip: (seg) ->
    if seg.isHorizontal()
      @p1.x = Math.max seg.minX(), @p1.x
      @p2.x = Math.max seg.minX(), @p2.x
      @p1.x = Math.min seg.maxX(), @p1.x
      @p2.x = Math.min seg.maxX(), @p2.x
    else
      @p1.y = Math.max seg.minY(), @p1.y
      @p2.y = Math.max seg.minY(), @p2.y
      @p1.y = Math.min seg.maxY(), @p1.y
      @p2.y = Math.min seg.maxY(), @p2.y

  
  toString: ->
    p1 = if @p1 then @p1.toString() else "null"
    p2 = if @p2 then @p2.toString() else "null"
    "segment: p1=("+p1+"), p2=("+p2+")"

  drawRect: (ctx = swGame.globals.ctx, color = "aaeeee")->
    ctx.strokeStyle = color
    ctx.lineCap = "square"
    ctx.strokeRect @p1.x, @p1.y, @p2.x - @p1.x, @p2.y - @p1.y

  draw: (ctx = swGame.globals.ctx, color = "aaeeee") ->
    ctx.strokeStyle = color
    ctx.lineCap = "square"
    ctx.beginPath()
    ctx.moveTo @p1.x,@p1.y
    ctx.lineTo @p2.x,@p2.y
    ctx.closePath()
    ctx.stroke()
