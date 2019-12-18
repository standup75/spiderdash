window.swTests ?= []

window.swTests.geometry = ->
  QUnit.test "swGame.Point.isInsidePath, swGame.Point.init", ->
    pt = swGame.Point.make(630,310)
    path = [swGame.Point.make(-5, -5), swGame.Point.make(635, -5), swGame.Point.make(635, 315), swGame.Point.make(-5, 315)]
    equal 1, pt.isInsidePath(path), "Check that the point "+JSON.stringify(pt)+" is inside this path: "+JSON.stringify(path)
    pointToFree = pointToFree.unmake() for pointToFree in path
    pt.init(120,27)
    path = [swGame.Point.make(115, 63), swGame.Point.make(195, 63), swGame.Point.make(195, -5), swGame.Point.make(635, -5), swGame.Point.make(635, 315), swGame.Point.make(-5, 315), swGame.Point.make(-5, -5), swGame.Point.make(43, -5), swGame.Point.make(43, 27), swGame.Point.make(115, 27)]
    equal 0, pt.isInsidePath(path), "Check that the point "+JSON.stringify(pt)+" is not inside this path: "+JSON.stringify(path)
    pointToFree = pointToFree.unmake() for pointToFree in path
    pt.init(120,63)
    path = [swGame.Point.make(115, 63), swGame.Point.make(195, 63), swGame.Point.make(195, -5), swGame.Point.make(635, -5), swGame.Point.make(635, 315), swGame.Point.make(-5, 315), swGame.Point.make(-5, -5), swGame.Point.make(43, -5), swGame.Point.make(43, 27), swGame.Point.make(115, 27)]
    equal 0, pt.isInsidePath(path), "Points on a segment must be considered outside the path: Check that the point "+JSON.stringify(pt)+" is not inside this path: "+JSON.stringify(path)
    pointToFree = pointToFree.unmake() for pointToFree in path
    pt.init(75,19)
    path = [swGame.Point.make(71, 15), swGame.Point.make(71, 51), swGame.Point.make(135, 51), swGame.Point.make(135, -5), swGame.Point.make(635, -5), swGame.Point.make(635, 315), swGame.Point.make(-5, 315), swGame.Point.make(-5, 15)]
    equal 0, pt.isInsidePath(path), "points on a segment must be considered outside the path: Check that the point "+JSON.stringify(pt)+" is not inside this path: "+JSON.stringify(path)
    pointToFree = pointToFree.unmake() for pointToFree in path
    pt.init(95,27)
    path = [swGame.Point.make(91, 27), swGame.Point.make(91, 315), swGame.Point.make(-5, 315), swGame.Point.make(-5, 27)]
    equal 0, pt.isInsidePath(path), "Points in the prolongation of a segment must ignore that it crosses the segment: Check that the point "+JSON.stringify(pt)+" is not inside this path: "+JSON.stringify(path)
    pointToFree = pointToFree.unmake() for pointToFree in path
    pt.init(627,193)
    path = [swGame.Point.make(0, 0), swGame.Point.make(630, 0), swGame.Point.make(630, 290), swGame.Point.make(0, 290)]
    equal 1, pt.isInsidePath(path), "Check that the point "+JSON.stringify(pt)+" is inside this path: "+JSON.stringify(path)
    pt = pt.unmake()
  QUnit.test "swGame.Point.directionTo", ->
    pt = swGame.Point.make 10,10
    pt2 = swGame.Point.make 20,10
    pt3 = pt.directionTo(pt2)
    pt4 = pt2.directionTo(pt)
    equal pt3.x, -1
    equal pt4.x, 1
    pt3.unmake()
    pt4.unmake()
    pt.init 10,10
    pt2.init 10,20
    pt3 = pt.directionTo(pt2)
    pt4 = pt2.directionTo(pt)
    equal pt3.y, -1
    equal pt4.y, 1
    pt3.unmake()
    pt4.unmake()
    pt = pt.unmake()
    pt2 = pt2.unmake()
  QUnit.test "swGame.Point.getCopy", ->
    pt = swGame.Point.make 10,10
    pt2 = pt.getCopy()
    pt.x=20
    pt.y=20
    equal pt2.x, 10, "changing the original does not affect the copy"
    equal pt2.y, 10
    pt.unmake()
  QUnit.test "swGame.Segment.make", ->
    pt = swGame.Point.make 10,10
    pt2 = swGame.Point.make 20,10
    seg = swGame.Segment.make pt, pt2
    seg.p1.x = 30
    seg.p1.y = 30
    seg.p2.x = 40
    seg.p2.y = 40
    equal pt.x, 10, "creating a new segment create copies of the points"
    equal pt.y, 10, "creating a new segment create copies of the points"
    equal pt2.x, 20, "creating a new segment create copies of the points"
    equal pt2.y, 10, "creating a new segment create copies of the points"
    pt.unmake()
    pt2.unmake()
    equal seg.p1.status, "in use"
    equal seg.p2.status, "in use"
    seg.unmake()
  QUnit.test "swGame.Segment.unmake", ->
    hasError = false
    seg = swGame.Segment.make [0,0], [10,10]
    seg.unmake()
    equal seg.p1, null
    equal seg.p2, null
    equal seg.status, "free"
    try
      raises seg.unmake(), "unmake called twice raises an exception"
    catch error
      ok error.indexOf('called unmake one too many time') == 0
      hasError = true
    ok hasError
  QUnit.test "swGame.Segment.crossesPath, swGame.Segment.init", ->
    seg = swGame.Segment.make [230, 51], [227, 51]
    path = [swGame.Point.make(235, -5), swGame.Point.make(235, 51), swGame.Point.make(231, 51)]
    ok !seg.crossesPath(path), "Check that the segment "+JSON.stringify(seg)+" does not cross this path: "+JSON.stringify(path)
    seg.init [231, 51], [227, 51]
    pointToFree = pointToFree.unmake() for pointToFree in path
    path = [swGame.Point.make(235, -5), swGame.Point.make(235, 51), swGame.Point.make(231, 51)]
    ok seg.crossesPath(path), "Check that the segment "+JSON.stringify(seg)+" crosses this path: "+JSON.stringify(path)+" with intersection.x = 231"
    pointToFree = pointToFree.unmake() for pointToFree in path
    seg = seg.unmake()
  QUnit.test "swGame.Segment.getIntersection", ->
    seg = swGame.Segment.make [231, 51], [227, 51]
    path = [swGame.Point.make(235, -5), swGame.Point.make(235, 51), swGame.Point.make(231, 51)]
    res = seg.getIntersection(path)
    equal res.intersection.x, 231, "Check that the segment "+JSON.stringify(seg)+" crosses this path: "+JSON.stringify(path)+" with intersection.x = 231"
    equal res.intersection.y, 51, "Check that the segment "+JSON.stringify(seg)+" crosses this path: "+JSON.stringify(path)+" with intersection.y = 51"
    equal res.index, 2
    seg.init [303, 199], [319, -5]
    pointToFree = pointToFree.unmake() for pointToFree in path
    path = [swGame.Point.make(305, 145), swGame.Point.make(335, 175), swGame.Point.make(334, 101), swGame.Point.make(360, 135)]
    res = seg.getIntersection(path)
    equal res.intersection.x, 307, "Check that the segment "+JSON.stringify(seg)+" crosses this path: "+JSON.stringify(path)+" with intersection.x = 307"
    equal res.intersection.y, 145, "Check that the segment "+JSON.stringify(seg)+" crosses this path: "+JSON.stringify(path)+" with intersection.y = 145"
    pointToFree = pointToFree.unmake() for pointToFree in path
    path = [swGame.Point.make(0, 0), swGame.Point.make(630, 0), swGame.Point.make(630, 290), swGame.Point.make(0, 290)]
    seg.init [628, 152], [630, 152]
    res = seg.getIntersection(path)
    equal res.intersection.x, 630, "Check that the segment "+JSON.stringify(seg)+" crosses this path: "+JSON.stringify(path)+" with intersection.x = 630"
    equal res.intersection.y, 152, "Check that the segment "+JSON.stringify(seg)+" crosses this path: "+JSON.stringify(path)+" with intersection.y = 152"
    pointToFree = pointToFree.unmake() for pointToFree in path
    path = [swGame.Point.make(0, 0), swGame.Point.make(630, 0), swGame.Point.make(630, 290), swGame.Point.make(0, 290)]
    seg.init [16, 150], [0, 150]
    res = seg.getIntersection(path)
    equal res.intersection.x, 0, "Check that the segment "+JSON.stringify(seg)+" crosses this path: "+JSON.stringify(path)+" with intersection.x = 0"
    equal res.intersection.y, 150, "Check that the segment "+JSON.stringify(seg)+" crosses this path: "+JSON.stringify(path)+" with intersection.y = 150"
    seg.init [2, 2], [600, 290]
    res = seg.getIntersection(path)
    equal res.intersection.x, 600, "Check that the segment "+JSON.stringify(seg)+" crosses this path: "+JSON.stringify(path)+" with intersection.x = 630"
    equal res.intersection.y, 290, "Check that the segment "+JSON.stringify(seg)+" crosses this path: "+JSON.stringify(path)+" with intersection.y = 193"
    seg = seg.unmake()
    pointToFree = pointToFree.unmake() for pointToFree in path
  QUnit.test "swGame.Segment.crossesPath", ->
    seg = swGame.Segment.make [231, 51], [227, 51]
    path = [swGame.Point.make(235, -5), swGame.Point.make(235, 51), swGame.Point.make(231, 51)]
    ok seg.crossesPath(path), "Check that the segment "+JSON.stringify(seg)+" crosses this path: "+JSON.stringify(path)
    seg.init [303, 199], [319, -5]
    pointToFree = pointToFree.unmake() for pointToFree in path
    path = [swGame.Point.make(305, 145), swGame.Point.make(335, 175), swGame.Point.make(334, 101), swGame.Point.make(360, 135)]
    ok seg.crossesPath(path), "Check that the segment "+JSON.stringify(seg)+" crosses this path: "+JSON.stringify(path)
    pointToFree = pointToFree.unmake() for pointToFree in path
    path = [swGame.Point.make(0, 0), swGame.Point.make(630, 0), swGame.Point.make(630, 290), swGame.Point.make(0, 290)]
    seg.init [628, 152], [630, 152]
    ok seg.crossesPath(path), "Check that the segment "+JSON.stringify(seg)+" crosses this path: "+JSON.stringify(path)
    seg = seg.unmake()
    pointToFree = pointToFree.unmake() for pointToFree in path
  QUnit.test "swGame.Segment.isInsidePath", ->
    seg = swGame.Segment.make [2, 2], [7, 7]
    path = [swGame.Point.make(0, 0), swGame.Point.make(10, 0), swGame.Point.make(10, 10), swGame.Point.make(0, 10)]
    ok seg.isInsidePath(path), "Check that the segment "+JSON.stringify(seg)+" is inside this path: "+JSON.stringify(path)
    seg.init [2, 2], [30, 2]
    ok !seg.isInsidePath(path), "Check that the segment "+JSON.stringify(seg)+" is NOT inside this path: "+JSON.stringify(path)
    seg.init [30, 2], [40, 2]
    ok !seg.isInsidePath(path), "Check that the segment "+JSON.stringify(seg)+" is NOT inside this path: "+JSON.stringify(path)
    pointToFree = pointToFree.unmake() for pointToFree in path
    seg = seg.unmake()
  QUnit.test "swGame.Segment.rotate", ->
    seg = swGame.Segment.make [10, 10], [15, 10]
    seg.rotate Math.PI/4
    equal ~~seg.p1.x, 10, "rotate PI/4"
    equal ~~seg.p1.y, 8
    equal ~~seg.p2.x, 14
    equal ~~seg.p2.y, 11
    seg = seg.unmake()
  QUnit.test "swGame.Segment.resize", ->
    seg = swGame.Segment.make [10, 10], [15, 15]
    seg.resize 5
    equal ~~seg.p1.x, 10, "resized to measure 5px"
    equal ~~seg.p1.y, 10
    equal ~~seg.p2.x, 14
    equal ~~seg.p2.y, 14
    seg = seg.unmake()
  QUnit.test "swGame.Segment.crossesSegment", ->
    seg = swGame.Segment.make [0, 0], [10, 10]
    seg2 = swGame.Segment.make [0, 10], [10, 0]
    pt = seg.crossesSegment seg2
    equal pt.x, 5
    equal pt.y, 5
    pt.unmake()
    seg2.init [0, 5], [10, 15]
    ok !seg.crossesSegment(seg2)
    seg = seg.unmake()
    seg2 = seg2.unmake()
  QUnit.test "swGame.Segment._makesACross", ->
    seg = swGame.Segment.make [0, 0], [10, 0]
    seg2 = swGame.Segment.make [10, 0], [10, 10]
    ok seg._makesACross(seg2)
    seg2.init [10, 1], [10, 10]
    ok !seg._makesACross(seg2)
    seg = seg.unmake()
    seg2 = seg2.unmake()
  QUnit.test "swGame.Segment.contains", ->
    pt = swGame.Point.make(71,-5)
    seg = swGame.Segment.make [-5, -5], [635, -5]
    equal seg.contains(pt), true, "Check that the point "+JSON.stringify(pt)+" is on the segment: "+JSON.stringify(seg)
    pt.init(71,0)
    seg.init [-5, -5], [635, -5]
    equal seg.contains(pt), false, "Check that the point "+JSON.stringify(pt)+" is not on the segment: "+JSON.stringify(seg)
    pt = pt.unmake()
    seg = seg.unmake()
  QUnit.test "swGame.Segment: max, min functions", ->
    seg = swGame.Segment.make [0, 5], [10, 15]
    equal 0, seg.minX(), "minX is 0 for "+JSON.stringify(seg)
    equal 5, seg.minY(), "minY is 5 for "+JSON.stringify(seg)
    equal 10, seg.maxX(), "maxX is 10 for "+JSON.stringify(seg)
    equal 15, seg.maxY(), "maxY is 15 for "+JSON.stringify(seg)
    equal 0, seg.minX(), "minX remains 0 for "+JSON.stringify(seg)
    equal 5, seg.minY(), "minY remains 5 for "+JSON.stringify(seg)
    equal 10, seg.maxX(), "maxX remains 10 for "+JSON.stringify(seg)
    equal 15, seg.maxY(), "maxY remains 15 for "+JSON.stringify(seg)
    seg = seg.unmake()
  QUnit.test "swGame.Segment.resize", ->
    seg = swGame.Segment.make([0,0],[10,10])
    seg.resize(11)
    ok (seg.p1.x-seg.p2.x)*(seg.p1.x-seg.p2.x)+(seg.p1.y-seg.p2.y)*(seg.p1.y-seg.p2.y)>10*10
    ok (seg.p1.x-seg.p2.x)*(seg.p1.x-seg.p2.x)+(seg.p1.y-seg.p2.y)*(seg.p1.y-seg.p2.y)<12*12
    seg.init([0,0],[10,10])
    seg.resize(19)
    ok (seg.p1.x-seg.p2.x)*(seg.p1.x-seg.p2.x)+(seg.p1.y-seg.p2.y)*(seg.p1.y-seg.p2.y)>18*18
    ok (seg.p1.x-seg.p2.x)*(seg.p1.x-seg.p2.x)+(seg.p1.y-seg.p2.y)*(seg.p1.y-seg.p2.y)<20*20
    seg.init([10,10],[0,0])
    seg.resize(11)
    ok (seg.p1.x-seg.p2.x)*(seg.p1.x-seg.p2.x)+(seg.p1.y-seg.p2.y)*(seg.p1.y-seg.p2.y)>10*10
    ok (seg.p1.x-seg.p2.x)*(seg.p1.x-seg.p2.x)+(seg.p1.y-seg.p2.y)*(seg.p1.y-seg.p2.y)<12*12
    seg.init([10,10],[0,0])
    seg.resize(19)
    ok (seg.p1.x-seg.p2.x)*(seg.p1.x-seg.p2.x)+(seg.p1.y-seg.p2.y)*(seg.p1.y-seg.p2.y)>18*18
    ok (seg.p1.x-seg.p2.x)*(seg.p1.x-seg.p2.x)+(seg.p1.y-seg.p2.y)*(seg.p1.y-seg.p2.y)<20*20
    seg.init([10,10],[10,0])
    seg.resize(9)
    ok (seg.p1.x-seg.p2.x)*(seg.p1.x-seg.p2.x)+(seg.p1.y-seg.p2.y)*(seg.p1.y-seg.p2.y)>8*8
    ok (seg.p1.x-seg.p2.x)*(seg.p1.x-seg.p2.x)+(seg.p1.y-seg.p2.y)*(seg.p1.y-seg.p2.y)<10*10
    seg.init([10,10],[10,0])
    seg.resize(11)
    ok (seg.p1.x-seg.p2.x)*(seg.p1.x-seg.p2.x)+(seg.p1.y-seg.p2.y)*(seg.p1.y-seg.p2.y)>10*10
    ok (seg.p1.x-seg.p2.x)*(seg.p1.x-seg.p2.x)+(seg.p1.y-seg.p2.y)*(seg.p1.y-seg.p2.y)<12*12
    seg.init([10,0],[10,10])
    seg.resize(9)
    ok (seg.p1.x-seg.p2.x)*(seg.p1.x-seg.p2.x)+(seg.p1.y-seg.p2.y)*(seg.p1.y-seg.p2.y)>8*8
    ok (seg.p1.x-seg.p2.x)*(seg.p1.x-seg.p2.x)+(seg.p1.y-seg.p2.y)*(seg.p1.y-seg.p2.y)<10*10
    seg.init([10,0],[10,10])
    seg.resize(11)
    ok (seg.p1.x-seg.p2.x)*(seg.p1.x-seg.p2.x)+(seg.p1.y-seg.p2.y)*(seg.p1.y-seg.p2.y)>10*10
    ok (seg.p1.x-seg.p2.x)*(seg.p1.x-seg.p2.x)+(seg.p1.y-seg.p2.y)*(seg.p1.y-seg.p2.y)<12*12
    seg.init([0,0],[100,100])
    seg.resize(11)
    ok (seg.p1.x-seg.p2.x)*(seg.p1.x-seg.p2.x)+(seg.p1.y-seg.p2.y)*(seg.p1.y-seg.p2.y)>10*10
    ok (seg.p1.x-seg.p2.x)*(seg.p1.x-seg.p2.x)+(seg.p1.y-seg.p2.y)*(seg.p1.y-seg.p2.y)<12*12
    seg = seg.unmake()
