class swGame.AbstractPath
  "use strict"
  path: null
  images:
    horizontal: swGame.images.add "#{swGame.settings.assetsPath}/path/drawingPath_horizontal.png"
    vertical: swGame.images.add "#{swGame.settings.assetsPath}/path/drawingPath_vertical.png"
  ctx: null
  
  _getPoint: (pt0, pt1) ->
    if pt1 is undefined
      if pt0 instanceof swGame.Point
        return pt0
      else
        console.error "only one argument has been passed to swGame.Path.getPoints and it is not an instance of swGame.Point"
    else
      if isNaN(pt0) or isNaN(pt1)
        console.error "Wrong arguments, or negative coordinates passed to swGame.Path._getPoints"
      else
        return swGame.Point.make(pt0, pt1)
  pop: ->
    pt = @path.pop()
    pt = pt.unmake() if pt
  shift: ->
    pt = @path.shift()
    pt = pt.unmake() if pt
  unshift: (pt0, pt1) ->
    pt = @_getPoint pt0, pt1
    @path.unshift pt
  push: (pt0, pt1) ->
    pt = @_getPoint pt0, pt1
    @path.push pt

  # Constructor
    
  constructor: ->
    # implementation of this abstract class need to define @images in order to draw the path
    @init.apply(@, arguments)
    
  # destructor
  
  destroy: (leavePoints) -> @reset() unless leavePoints
    
  init: ->
    @reset()
    firstArgument = arguments[0]
    if firstArgument
      if arguments.length == 1 and firstArgument[0] and isNaN(firstArgument[0])
        @append.apply @, firstArgument
      else
        @append.apply @, arguments
  
  append: ->
    for pt in arguments
      if not pt instanceof swGame.Point or not pt instanceof Array
        console.error "swGame.path.append argument has a point that is not instance of Array or swGame.Point"
      else
        pt = swGame.Point.make(pt[0], pt[1]) if pt instanceof Array
        @path.push pt
    
  reset: ->
    pt = pt.unmake() for pt in @path if @path
    @path = []
    null

  length: -> @path.length
  get: (index) -> @path[index]
  equal: (otherPath) ->
    path = otherPath.path || otherPath
    return false if path.length != @path.length
    for pt, i in @path
      if pt.x isnt path[i].x or pt.y isnt path[i].y
        return false
    true
  includes: (pt0, pt1) ->
    pt = @_getPoint pt0, pt1
    for point in @path
      return true if point.x is pt.x and point.y is pt.y
    false
  getNextIndex: (index) ->
    (index + 1) % @path.length    
  getPreviousIndex: (index) ->
    index--
    if index < 0 then @path.length - 1 else index
  simplify: ->
    #return if not @path
    pathLength = @path.length
    return if pathLength<3
    index = pathLength
    while index--
      prevPt = @path[index]
      currPtIndex = if index - 1 >= 0 then index - 1 else pathLength + index - 1
      currPt = @path[currPtIndex]
      nextPt = if index - 2 >= 0 then @path[index - 2] else @path[pathLength + index - 2]
      if (prevPt.x is currPt.x and nextPt.x is currPt.x) or (prevPt.y is currPt.y and nextPt.y is currPt.y)
        @path.splice(currPtIndex, 1)
        pathLength = @path.length
    @

  calculatePx2: ->
    # http://stackoverflow.com/questions/451426/how-do-i-calculate-the-surface-area-of-a-2d-polygon
    sum = 0
    lastPoint = null
    @path.map (point, index) ->
      sum += lastPoint.x * point.y - point.x * lastPoint.y if lastPoint
      lastPoint = point
    sum += lastPoint.x * @path[0].y - @path[0].x * lastPoint.y
    0.5 * Math.abs sum
    
  getIntPathAndFreeExtPath: (intPath, extPath) ->
    if intPath
      pt.status = "reserved" for pt in intPath
      for pt in extPath
        pt.unmake() if pt.status == "in use"
      for pt in @path
        pt.unmake() if pt.status == "in use"
      pt.status = "in use" for pt in intPath 
      @path = intPath
  
  toString: ->
    "path: "+JSON.stringify(@path)

  crossesRect: (rect, closePath) ->
    path = @path
    index = path.length - 1
    crossed = false
    segmentFromThis = swGame.Segment.make()
    _crossesRect = (i, nextI) -> if segmentFromThis.init(path[i], path[nextI]).crossesRect(rect) then i else false
    while crossed is false and index--
      crossed = _crossesRect index, index + 1
    if closePath and crossed is false
      crossed = _crossesRect path.length - 1, 0
    segmentFromThis = segmentFromThis.unmake()
    crossed

  crossesRectMulti: (rect, closePath) ->
    path = @path
    index = path.length - 1
    crosses = []
    segmentFromThis = swGame.Segment.make()
    _crossesRect = (i, nextI) -> if segmentFromThis.init(path[i], path[nextI]).crossesRect(rect) then crosses.push(i) else false
    while index--
      _crossesRect index, index + 1
    if closePath
      _crossesRect path.length - 1, 0
    segmentFromThis = segmentFromThis.unmake()
    if crosses.length is 0 then null else crosses
    
  crossesPath: (path, closePath) ->
    path = path.path if path.path
    @_crossesPath path, closePath, (intersection, index) ->
      intersection.intersection = intersection.intersection.unmake()
      true
  
  getIntersection: (path, closePath) ->
    path = path.path if path.path
    @_crossesPath path, closePath, (intersection, index) ->
      {intersection: intersection.intersection, index: index}

  _crossesPath: (path, closePath, callback) ->
    index = @path.length - 1
    intersection = false
    segmentFromThis = swGame.Segment.make()
    while not intersection and index-- > 0
      intersection = segmentFromThis.init(@path[index], @path[index + 1]).getIntersection path
    if closePath and not intersection
      index = @path.length - 1
      intersection = segmentFromThis.init(@path[index], @path[0]).getIntersection path
    segmentFromThis = segmentFromThis.unmake()
    if intersection
      callback(intersection, index)
    else
      false
      
  contains: (point, includeSegment) ->
    prevPt = @path[@length() - 1]
    for pt in @path
      if includeSegment
        seg = swGame.Segment.make pt, prevPt
        isOnSeg = seg.contains point
        seg = seg.unmake()
        return true if isOnSeg
        prevPt = pt
      else
        return true if pt.equal(point)
    false
  
  each: (callback) ->
    res = false
    for pt, i in @path
      nextPt = @path[i + 1]
      res = true if nextPt and callback(pt, nextPt, i) 
    res
  
  eachClosed: (callback) ->
    lastIndex = @path.length - 1
    @each(callback)
    callback(@path[lastIndex], @path[0], lastIndex)
  
  eachBreak: (callback) ->
    for pt, i in @path
      nextPt = @path[i + 1]
      if nextPt
        res = callback(pt, nextPt, i)
        return res if res isnt false and res isnt null
    null
    
  drawPath: ->
    index = @path.length
    previousPoint = @path[--index]
    while currentPoint = @path[--index]
      @drawPathSegment currentPoint, previousPoint
      previousPoint = currentPoint

  drawPathSegment: (currentPoint, previousPoint) ->
    if previousPoint.x == currentPoint.x
      @_drawVerticalPath currentPoint, previousPoint
    else
      @_drawHorizontalPath currentPoint, previousPoint

  _drawVerticalPath: (currentPoint, previousPoint) ->
    ymin = Math.min previousPoint.y, currentPoint.y
    ymax = Math.max previousPoint.y, currentPoint.y
    ydiff = ymax-ymin
    @ctx.drawImage @images.vertical, 0, 0, 4, ydiff, currentPoint.x - 2, ymin, 4, ydiff

  _drawHorizontalPath: (currentPoint, previousPoint) ->
    xmin = Math.min previousPoint.x, currentPoint.x
    xmax = Math.max previousPoint.x, currentPoint.x
    xdiff = xmax-xmin
    @ctx.drawImage @images.horizontal, 0, 0, xdiff, 4, xmin, currentPoint.y - 2, xdiff, 4

  draw: (color, ctx) ->
    color ?= "eeaaee"
    index = @path.length - 1
    segmentToDraw = swGame.Segment.make()
    while index-- >0
      segmentToDraw.init([@path[index].x, @path[index].y], [@path[index + 1].x, @path[index + 1].y]).draw(ctx || @ctx, color)
    segmentToDraw = segmentToDraw.unmake()
