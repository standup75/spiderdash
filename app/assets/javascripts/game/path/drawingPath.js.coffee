class swGame.DrawingPath extends swGame.AbstractPath
  "use strict"
  leaveIt: true

  # repaint is not an event, but called in swGame.player._activeMove()
  # hence the absence of fat arrow
  repaint: (pos) ->
    if not @leaveIt
      @path.pop()
    else
      @leaveIt = false
    @_removeLoop pos
    @path.push pos
    @drawPath()
    
  _removeLoop: (lastPos) ->
    lastPt = null
    freePoints = false
    seg = swGame.Segment.make()
    for pt, i in @path
      pt.unmake() if freePoints
      if not freePoints and lastPt and seg.init(lastPt, pt).contains lastPos
        @leaveIt = true
        freePoints = true
        lastIndex = i
        pt.unmake()
      lastPt = pt
    @path = @path.slice 0, lastIndex if freePoints
    seg = seg.unmake()
  
  # adds a point in the drawing path
  push: (x, y) ->
    @pop() if not @leaveIt
    @path.push swGame.Point.make(x, y)
    @leaveIt = true

  pop: ->
    @path.pop()?.unmake()

  reset: ->
    @leaveIt = false
    super
  
  # called when the drawing path is closing
  # return true if the drawing path has made some progress
  # in the path, false if it went backwards
  # so that we can change the direction of the player accordingly
  # xProgress = true if the direction is positive on the x axis
  # yProgress = true if the direction is positive on the y axis
  isSameDirectionAsPath: (xProgress, yProgress) ->
    drawingPathLast = @path[@path.length-1]
    (xProgress == (@path[0].x <= drawingPathLast.x)) and (yProgress == (@path[0].y <= drawingPathLast.y))
  
  constructor: ->
    super
    @ctx = swGame.globals.ctx
  
  toString: ->
    "drawingPath: "+JSON.stringify(@path)
