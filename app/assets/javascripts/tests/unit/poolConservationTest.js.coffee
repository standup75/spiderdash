window.swTests ?= []
window.swTests.pool_conservation = ->
  getPlayerOnNewPath = ->
    p = new swGame.Player
    p.path = new swGame.Path [0,0], [10,0], [10,10], [0,10]
    p.drawingPath = new swGame.DrawingPath
    p.nextPos = p.path.getCopy(1)
    p.location = swGame.Point.make 5,0
    p.step = 4
    p
  createDrawingPath = (player) ->
    player.direction = swGame.Point.make 0, -1
    player.location = swGame.Point.make 6, 6
    dp = player.drawingPath.init [2,0], [2,8], [6,8], [6,6]
    dp.leaveIt = false
  createAndDeleteSomeSegments = ->
    segs=[]
    segs[i] = swGame.Segment.make [i,i], [10+i,10+i] for i in [0..50] 
    segs[i].unmake() for i in [0..50]
    
  path = null
  setPath = (newPath)->
    path = swGame.globals.path
    swGame.globals.path = newPath
  restorePath = ->
    swGame.globals.path = path
    
  QUnit.test "swGame.Segment conservation", ->
    createAndDeleteSomeSegments()
    segCount = swGame.PoolFactory.freePool.Segment.length
    ptCount = swGame.PoolFactory.freePool.Point.length
    # test
    seg = swGame.Segment.make()
    seg.init [0,0], [10,10]
    equal ptCount - 2, swGame.PoolFactory.freePool.Point.length, "init a segment uses 2 free Point object"
    equal segCount - 1, swGame.PoolFactory.freePool.Segment.length, "init a segment uses 1 free Segment object"
    seg = seg.unmake()
    equal ptCount, swGame.PoolFactory.freePool.Point.length, "unmaking a segment releases 2 Point object"
    equal segCount, swGame.PoolFactory.freePool.Segment.length, "init a segment releases 1 Segment object"
    seg = swGame.Segment.make [1,1], [11,11]
    equal ptCount - 2, swGame.PoolFactory.freePool.Point.length, "init a segment uses 2 free Point object"
    equal segCount - 1, swGame.PoolFactory.freePool.Segment.length, "init a segment uses 1 free Segment object"
    seg.init [2,2], [12,12]
    equal ptCount - 2, swGame.PoolFactory.freePool.Point.length, "re-init a segment does not change the number of free Point objects"
    equal segCount - 1, swGame.PoolFactory.freePool.Segment.length, "re-init a segment does not change the number of free Segment objects"
    seg = swGame.Segment.make [230, 51], [227, 51]
    path = [swGame.Point.make(235, -5), swGame.Point.make(235, 51), swGame.Point.make(231, 51)]
    segCount = swGame.PoolFactory.freePool.Segment.length
    ptCount = swGame.PoolFactory.freePool.Point.length
    seg.crossesPath(path)
    equal swGame.PoolFactory.freePool.Segment.length, segCount, "function swGame.Segment.crossesPath conserve the number of Segment objects free: "+segCount
    equal swGame.PoolFactory.freePool.Point.length, ptCount, "function swGame.Segment.crossesPath conserve the number of Point objects free: "+ptCount
    intersection = seg.getIntersection(path)
    equal swGame.PoolFactory.freePool.Segment.length, segCount, "function swGame.Segment.getIntersection conserve the number of Segment objects free: "+segCount
    equal swGame.PoolFactory.freePool.Point.length, ptCount, "function swGame.Segment.getIntersection conserve the number of Point objects free if no intersection is found: "+ptCount
    seg.init [231, 51], [227, 51]
    intersection = seg.getIntersection(path)
    equal swGame.PoolFactory.freePool.Segment.length, segCount, "function swGame.Segment.getIntersection conserve the number of Segment objects free: "+segCount
    equal swGame.PoolFactory.freePool.Point.length, ptCount-1, "function swGame.Segment.getIntersection uses 1 Point objects free if intersection is found: "+(ptCount-1)
    intersection.intersection.unmake()
    seg.unmake()
    pt.unmake() for pt in path
  QUnit.test "swGame.Fly conservation", ->
    createAndDeleteSomeSegments()
    p = getPlayerOnNewPath()
    createDrawingPath p
    swGame.globals.drawingPath = p.drawingPath
    setPath p.path
    segCount = swGame.PoolFactory.freePool.Segment.length
    ptCount = swGame.PoolFactory.freePool.Point.length
    fly = new swGame.Fly
    fly.repaint() for i in [0..50]
    fly.destroy()
    equal swGame.PoolFactory.freePool.Segment.length, segCount, "create and destroy fly conserve the number of Segment objects free: "+segCount
    equal swGame.PoolFactory.freePool.Point.length, ptCount, "create and destroy fly conserve the number of Point objects free: "+ptCount
    fly = new swGame.Fly
    al = fly.location.getCopy()
    al.x += 10
    al.y += 10
    segCount = swGame.PoolFactory.freePool.Segment.length
    ptCount = swGame.PoolFactory.freePool.Point.length
    fly._canContinue al
    equal swGame.PoolFactory.freePool.Segment.length, segCount, "function swGame.Fly._canContinue conserve the number of Segment objects free: "+segCount
    equal swGame.PoolFactory.freePool.Point.length, ptCount, "function swGame.Fly._canContinue conserve the number of Point objects free: "+ptCount
    al.unmake()
    fly.location.x = 4
    fly.location.y = 7
    al = fly.location.getCopy()
    al.x += 100
    al.y += 100
    segCount = swGame.PoolFactory.freePool.Segment.length
    ptCount = swGame.PoolFactory.freePool.Point.length
    fly._canContinue al
    equal swGame.PoolFactory.freePool.Segment.length, segCount, "function swGame.Fly._canContinue crossing the path conserve the number of Segment objects free: "+segCount
    equal swGame.PoolFactory.freePool.Point.length, ptCount, "function swGame.Fly._canContinue crossing the path conserve the number of Point objects free: "+ptCount
    al.unmake()
    segCount = swGame.PoolFactory.freePool.Segment.length
    ptCount = swGame.PoolFactory.freePool.Point.length
    fly._updateLocation()
    equal swGame.PoolFactory.freePool.Segment.length, segCount, "function swGame.Fly._updateLocation conserve the number of Segment objects free: "+segCount
    equal swGame.PoolFactory.freePool.Point.length, ptCount, "function swGame.Fly._updateLocation conserve the number of Point objects free: "+ptCount
    fly._move()
    equal swGame.PoolFactory.freePool.Segment.length, segCount, "function swGame.Fly._move conserve the number of Segment objects free: "+segCount
    equal swGame.PoolFactory.freePool.Point.length, ptCount, "function swGame.Fly._move conserve the number of Point objects free: "+ptCount
    fly._hitDrawingPath()
    equal swGame.PoolFactory.freePool.Segment.length, segCount, "function swGame.Fly._hitDrawingPath conserve the number of Segment objects free: "+segCount
    equal swGame.PoolFactory.freePool.Point.length, ptCount, "function swGame.Fly._hitDrawingPath conserve the number of Point objects free: "+ptCount
    fly.repaint()
    equal swGame.PoolFactory.freePool.Segment.length, segCount, "function swGame.Fly.repaint conserve the number of Segment objects free: "+segCount
    equal swGame.PoolFactory.freePool.Point.length, ptCount, "function swGame.Fly.repaint conserve the number of Point objects free: "+ptCount
    p.destroy()
    swGame.globals.drawingPath.reset()
    restorePath()
  QUnit.test "swGame.Monster conservation", ->
    createAndDeleteSomeSegments()
    segCount = swGame.PoolFactory.freePool.Segment.length
    ptCount = swGame.PoolFactory.freePool.Point.length
    monster = new swGame.Monster
    monster.repaint() for i in [0..50]
    monster.destroy()
    equal swGame.PoolFactory.freePool.Segment.length, segCount, "create and destroy monster conserve the number of Segment objects free: "+segCount
    equal swGame.PoolFactory.freePool.Point.length, ptCount, "create and destroy monster conserve the number of Point objects free: "+ptCount
    monster = new swGame.Monster
    segCount = swGame.PoolFactory.freePool.Segment.length
    ptCount = swGame.PoolFactory.freePool.Point.length
    res = monster.repaint()
    equal swGame.PoolFactory.freePool.Segment.length, segCount, "function swGame.Monster.repaint conserve the number of Segment objects free: "+segCount
    equal swGame.PoolFactory.freePool.Point.length, ptCount, "function swGame.Monster.repaint conserve the number of Point objects free: "+ptCount
  QUnit.test "swGame.Ennemy conservation", ->
    createAndDeleteSomeSegments()
    p = getPlayerOnNewPath()
    createDrawingPath p
    swGame.globals.drawingPath = p.drawingPath
    segCount = swGame.PoolFactory.freePool.Segment.length
    ptCount = swGame.PoolFactory.freePool.Point.length
    ennemy = new swGame.Ennemy
    ennemy.destroy()
    equal swGame.PoolFactory.freePool.Segment.length, segCount, "create and destroy ennemy conserve the number of Segment objects free: "+segCount
    equal swGame.PoolFactory.freePool.Point.length, ptCount, "create and destroy ennemy conserve the number of Point objects free: "+ptCount
    ennemy = new swGame.Ennemy
    ennemy.repaint() for i in [0..50]
    segCount = swGame.PoolFactory.freePool.Segment.length
    ptCount = swGame.PoolFactory.freePool.Point.length
    res = ennemy.repaint()
    equal swGame.PoolFactory.freePool.Segment.length, segCount, "function swGame.Ennemy.repaint conserve the number of Segment objects free: "+segCount
    equal swGame.PoolFactory.freePool.Point.length, ptCount, "function swGame.Ennemy.repaint conserve the number of Point objects free: "+ptCount
    segCount = swGame.PoolFactory.freePool.Segment.length-1
    ptCount = swGame.PoolFactory.freePool.Point.length-2
    stick = ennemy._computeStick()
    equal swGame.PoolFactory.freePool.Segment.length, segCount, "function swGame.Ennemy._computeStick uses 1 free Segment object: "+segCount
    equal swGame.PoolFactory.freePool.Point.length, ptCount, "function swGame.Ennemy._computeStick uses 2 free Point objects: "+ptCount
    ennemy._hitDrawingPath stick, false
    equal swGame.PoolFactory.freePool.Segment.length, segCount, "function swGame.Ennemy._hitDrawingPath conserve the number of Segment objects free: "+segCount
    equal swGame.PoolFactory.freePool.Point.length, ptCount, "function swGame.Ennemy._hitDrawingPath conserve the number of Point objects free: "+ptCount
    ennemy._hitDrawingPath stick, true
    equal swGame.PoolFactory.freePool.Segment.length, segCount, "function swGame.Ennemy._hitDrawingPath with panicMode conserve the number of Segment objects free: "+segCount
    equal swGame.PoolFactory.freePool.Point.length, ptCount, "function swGame.Ennemy._hitDrawingPath with panicMode conserve the number of Point objects free: "+ptCount
    stick.unmake()
    p.destroy()
    swGame.globals.drawingPath.reset()
  QUnit.test "swGame.Player conservation", ->
    createAndDeleteSomeSegments()
    pubsub.subscribe "isInsidePath_done_done", ->
      equal swGame.PoolFactory.freePool.Segment.length, segCount, "function swGame.Player.activeMove after resolving the path conserve the number of Segment objects free: "+segCount
      equal swGame.PoolFactory.freePool.Point.length, ptCount, "function swGame.Player.activeMove after resolving the path releases 2 Point objects (@direction and the upper right corner of the former path) but retains 1 (the location added to the drawing path): "+ptCount
      p.destroy()
      swGame.globals.drawingPath.reset()
    segCount = swGame.PoolFactory.freePool.Segment.length
    ptCount = swGame.PoolFactory.freePool.Point.length
    player = new swGame.Player
    player.repaint() for i in [0..50]
    player.destroy()
    equal swGame.PoolFactory.freePool.Segment.length, segCount, "create and destroy player conserve the number of Segment objects free: "+segCount
    equal swGame.PoolFactory.freePool.Point.length, ptCount, "create and destroy player conserve the number of Point objects free: "+ptCount
    player = new swGame.Player
    player.repaint() for i in [0..50]
    segCount = swGame.PoolFactory.freePool.Segment.length
    ptCount = swGame.PoolFactory.freePool.Point.length
    res = player.repaint()
    equal swGame.PoolFactory.freePool.Segment.length, segCount, "function swGame.Player.repaint conserve the number of Segment objects free: "+segCount
    equal swGame.PoolFactory.freePool.Point.length, ptCount, "function swGame.Player.repaint conserve the number of Point objects free: "+ptCount
    player.destroy()
    p = getPlayerOnNewPath()
    createDrawingPath p
    segCount = swGame.PoolFactory.freePool.Segment.length
    ptCount = swGame.PoolFactory.freePool.Point.length
    p._activeMove()
    equal swGame.PoolFactory.freePool.Segment.length, segCount, "function swGame.Player.activeMove before resolving the path conserve the number of Segment objects free: "+segCount
    equal swGame.PoolFactory.freePool.Point.length, ptCount-1, "function swGame.Player.activeMove before resolving the path uses one Point to put it in the DrawingPath: "+(ptCount-1)
    p.direction.x = 1
    p.direction.y = 0
    ptCount = swGame.PoolFactory.freePool.Point.length + 1
    p._activeMove()
  QUnit.test "swGame.Centipede conservation", ->
    createAndDeleteSomeSegments()
    segCount = swGame.PoolFactory.freePool.Segment.length
    ptCount = swGame.PoolFactory.freePool.Point.length
    centipede = new swGame.Centipede
    centipede.repaint() for i in [0..50]
    centipede.destroy()
    equal swGame.PoolFactory.freePool.Segment.length, segCount, "create and destroy centipede conserve the number of Segment objects free: "+segCount
    equal swGame.PoolFactory.freePool.Point.length, ptCount, "create and destroy centipede conserve the number of Point objects free: "+ptCount
    centipede = new swGame.Centipede
    segCount = swGame.PoolFactory.freePool.Segment.length
    ptCount = swGame.PoolFactory.freePool.Point.length
    res = centipede._movePods()
    equal swGame.PoolFactory.freePool.Segment.length, segCount, "function swGame.Centipede._movePods conserve the number of Segment objects free: "+segCount
    equal swGame.PoolFactory.freePool.Point.length, ptCount-1, "function swGame.Centipede._movePods uses 1 free Point objects for the @headPod: "+ptCount-1
    centipede.repaint() for n in [1..20]
    segCount = swGame.PoolFactory.freePool.Segment.length
    ptCount = swGame.PoolFactory.freePool.Point.length
    pod = centipede.bufferedPods[centipede.bufferedPods.length-2]
    trail = centipede._updateVector pod
    equal swGame.PoolFactory.freePool.Segment.length, segCount-1, "function swGame.Centipede._updateVector uses one free Segment object: "+(segCount-1)
    equal swGame.PoolFactory.freePool.Point.length, ptCount-2, "function swGame.Centipede._updateVector uses two free Point objects: "+(ptCount-2)
    segCount = swGame.PoolFactory.freePool.Segment.length
    ptCount = swGame.PoolFactory.freePool.Point.length
    intersection = centipede._hitTheWall trail
    equal swGame.PoolFactory.freePool.Segment.length, segCount, "function swGame.Centipede._hitTheWall conserve the number of Segment objects free: "+segCount
    equal swGame.PoolFactory.freePool.Point.length, ptCount, "function swGame.Centipede._hitTheWall conserve the number of Point objects free: "+ptCount
    segCount = swGame.PoolFactory.freePool.Segment.length
    ptCount = swGame.PoolFactory.freePool.Point.length
    res = centipede._movePods(null, ->)
    equal swGame.PoolFactory.freePool.Segment.length, segCount, "function swGame.Centipede._movePods conserve the number of Segment objects free: "+segCount
    equal swGame.PoolFactory.freePool.Point.length, ptCount-1, "function swGame.Centipede._movePod uses 1 free Point objects for the @headPod: "+ptCount-1
    segCount = swGame.PoolFactory.freePool.Segment.length
    ptCount = swGame.PoolFactory.freePool.Point.length
    centipede.repaint()
    equal swGame.PoolFactory.freePool.Segment.length, segCount, "function swGame.Centipede.repaint conserve the number of Segment objects free: "+segCount
    equal swGame.PoolFactory.freePool.Point.length, ptCount, "function swGame.Centipede.repaint conserve the number of Point objects free: "+ptCount
    p = getPlayerOnNewPath()
    createDrawingPath p
    swGame.globals.drawingPath = p.drawingPath
    segCount = swGame.PoolFactory.freePool.Segment.length
    ptCount = swGame.PoolFactory.freePool.Point.length
    centipede._hitDrawingPath()
    equal swGame.PoolFactory.freePool.Segment.length, segCount, "function swGame.Centipede._hitDrawingPath conserve the number of Segment objects free: "+segCount
    equal swGame.PoolFactory.freePool.Point.length, ptCount, "function swGame.Centipede._hitDrawingPath conserve the number of Point objects free: "+ptCount
    p.destroy()
    swGame.globals.drawingPath.reset()
    centipede.destroy()
