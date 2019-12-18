window.swTests ?= []

window.swTests.drawing_path = ->
  prefix = "swGame.drawingPath"
  dp = new swGame.DrawingPath
  QUnit.test prefix+".reset", ->
    dp.reset()
    equal dp.path.length, 0, "the path is empty"
    ok !dp.leaveIt, "leaveIt is false"
  QUnit.test prefix+".constructor", ->
    dp = new swGame.DrawingPath
    equal dp.path.length, 0, "the path is empty"
    ok !dp.leaveIt, "leaveIt is false"
  QUnit.test prefix+".pop", ->
    dp.reset()
    dp.pop()
    equal dp.length(), 0, "pop with empty path does not throw an error"
    dp.push 1,1
    dp.push 2,2
    dp.push 3,3
    dp.pop()
    equal dp.length(), 2, "pop removes an element from the path"
    equal dp.path[0].x, 1
    equal dp.path[0].y, 1
    equal dp.path[1].x, 2
    equal dp.path[1].y, 2
  QUnit.test prefix+".push", ->
    dp.reset()
    dp.push 1,1
    dp.push 2,2
    dp.push 3,3
    pt = swGame.Point.make(10,10)
    dp.repaint pt
    dp.push 4,4
    for i in [1,2,3,4]
      pt = dp.path[i-1]
      equal pt.x, i, "check that ("+i+","+i+") has been push in the drawingPath"
      equal pt.y, i, "check that ("+i+","+i+") has been push in the drawingPath"
  QUnit.test prefix+".isSameDirectionAsPath", ->
    dp.reset()
    dp.push 1,1
    dp.push 2,2
    dp.push 3,3
    ok dp.isSameDirectionAsPath({x:true, y:true})
    ok !dp.isSameDirectionAsPath({x:true, y:false})
    ok !dp.isSameDirectionAsPath({x:false, y:true})
    ok !dp.isSameDirectionAsPath({x:false, y:false})
    dp.reset()
    dp.push 3,3
    dp.push 2,2
    dp.push 1,1
    ok !dp.isSameDirectionAsPath({x:true, y:true})
    ok !dp.isSameDirectionAsPath({x:true, y:false})
    ok !dp.isSameDirectionAsPath({x:false, y:true})
    ok dp.isSameDirectionAsPath({x:false, y:false})
  QUnit.test prefix+"._removeLoop straight line, going back", ->
    dp.reset()
    dp.push 1,10
    dp.push 1,20
    dp.push 1,30
    pt = swGame.Point.make 1, 25
    dp._removeLoop pt
    pt = pt.unmake()
    equal dp.length(), 2, "going back removes a point in the drawing path"
    equal dp.path[0].y, 10
    equal dp.path[1].y, 20
    equal dp.path[0].status, "in use"
    equal dp.path[1].status, "in use"
  QUnit.test prefix+"._removeLoop", ->
    dp.reset()
    dp.push 1,10
    dp.push 1,30
    dp.push 10,30
    dp.push 10,40
    dp.push 120,40
    dp.push 120,30
    dp.push 120,20
    ref = dp.path[1]
    ref2 = dp.path[2]
    ref3 = dp.path[3]
    ref4 = dp.path[4]
    ref5 = dp.path[5]
    ref6 = dp.path[6]
    pt = swGame.Point.make 1, 20
    dp._removeLoop pt
    pt = pt.unmake()
    equal dp.length(), 1
    equal dp.path[0].y, 10
    equal dp.path[0].x, 1
    equal dp.path[0].status, "in use"
    equal ref.status, "free"
    equal ref2.status, "free"
    equal ref3.status, "free"
    equal ref4.status, "free"
    equal ref5.status, "free"
    equal ref6.status, "free"
  QUnit.test prefix+"._removeLoop with repaint", ->
    dp.reset()
    dp.push 153,97
    dp.push 153,141
    dp.push 197,141
    dp.push 197,117
    ref = dp.path[2]
    ref2 = dp.path[3]
    newPt = swGame.Point.make 155,117
    dp.repaint newPt
    newPt = swGame.Point.make 153,117
    dp.repaint newPt
    equal dp.length(), 2, "loop deleted"
    equal dp.path[0].x, 153
    equal dp.path[1].x, 153
    equal dp.path[0].y, 97
    equal dp.path[1].y, 117
    equal dp.path[0].status, "in use"
    equal dp.path[1].status, "in use"
    equal ref.status, "free"
    equal ref2.status, "free"
    