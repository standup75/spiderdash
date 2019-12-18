window.swTests ?= []

window.swTests.path = ->
  prefix = "swGame.Path"
  QUnit.test prefix+".pop", ->
    path = new swGame.Path [1,1], [2,2], [3,3]
    path.pop()
    equal path.length(), 2
    equal path.get(0).x, 1
    equal path.get(1).x, 2
    path.destroy()
  QUnit.test prefix+".shift", ->
    path = new swGame.Path [1,1], [2,2], [3,3]
    path.shift()
    equal path.length(), 2
    equal path.get(0).x, 2
    equal path.get(1).x, 3
    path.destroy()
  QUnit.test prefix+".unshift", ->
    path = new swGame.Path [1,1], [2,2], [3,3]
    path.unshift 0,0
    equal path.length(), 4
    equal path.get(0).x, 0
    equal path.get(1).x, 1
    path.destroy()
  QUnit.test prefix+".push", ->
    path = new swGame.Path [1,1], [2,2], [3,3]
    path.push 4,4
    equal path.length(), 4
    equal path.get(2).x, 3
    equal path.get(3).x, 4
    path.destroy()
  QUnit.test prefix+".constructor", ->
    path = new swGame.Path
    equal path.length(), 0
    path.destroy()
    path = new swGame.Path [1,1], [2,2], [3, 3]
    equal path.length(), 3
    equal path.get(0).x, 1
    equal path.get(1).x, 2
    equal path.get(2).x, 3
    path.destroy()
    path = new swGame.Path [[1,1], [2,2], [3, 3]]
    equal path.length(), 3
    equal path.get(0).x, 1
    equal path.get(1).x, 2
    equal path.get(2).x, 3
    path.destroy()
  QUnit.test prefix+".destroy", ->
    path = new swGame.Path [291, 43], [247, 43], [247, 43], [199, 43], [199, -5]
    pt = path.path[0]
    path.destroy()
    equal 0, path.length()
    equal pt.status, "free"
  QUnit.test prefix+".init", ->
    path = new swGame.Path
    path.init [1,1], [2,2], [3, 3]
    equal path.length(), 3
    equal path.get(0).x, 1
    equal path.get(1).x, 2
    equal path.get(2).x, 3
    path.init [[1,1], [2,2], [3, 3]]
    equal path.length(), 3
    equal path.get(0).x, 1
    equal path.get(1).x, 2
    equal path.get(2).x, 3
    path.destroy()
  QUnit.test prefix+".append", ->
    path = new swGame.Path [1,1], [2,2], [3, 3]
    path.append [4,4], [5, 5]
    equal path.length(), 5
    equal path.get(2).x, 3
    equal path.get(3).x, 4
    equal path.get(4).x, 5
    path.destroy()
  QUnit.test prefix+".length", ->
    path = new swGame.Path [1,1], [2,2], [3, 3]
    equal path.length(), 3
    path.destroy()
  QUnit.test prefix+".get", ->
    path = new swGame.Path [1,10], [2,20], [3, 30]
    equal path.get(0).x, 1
    equal path.get(1).x, 2
    equal path.get(2).x, 3
    equal path.get(0).y, 10
    equal path.get(1).y, 20
    equal path.get(2).y, 30
    path.destroy()
  QUnit.test prefix+".getCopy", ->
    path = new swGame.Path [1,10], [2,20], [3, 30]
    pt = path.getCopy 0
    pt.x = 99
    equal path.get(0).x, 1
    equal path.get(0).y, 10
    equal pt.x, 99
    equal pt.y, 10
    path.destroy()
    pt.unmake()
  QUnit.test prefix+".includes", ->
    path = new swGame.Path [1,1], [3, 3]
    ok path.includes(1,1)
    ok !path.includes(2,2)
    ok path.includes(3,3)
    path.destroy()
  QUnit.test prefix+".getNextIndex", ->
    path = new swGame.Path [291, 43], [247, 43], [247, 43], [199, 43], [199, -5]
    equal 1, path.getNextIndex(0)
    equal 2, path.getNextIndex(1)
    equal 3, path.getNextIndex(2)
    equal 4, path.getNextIndex(3)
    equal 0, path.getNextIndex(4)
    path.destroy()
  QUnit.test prefix+".simplify", ->
    path = new swGame.Path [10, 10], [10, 20], [10, 30], [30, 30]
    path.simplify()
    equal 3, path.length(), "path simplified, 1 segment removed"
    ok !path.includes(10, 20), "the path contains the point 10,20"
    ok path.includes(10, 10), "the path contains the point 10,10"
    ok path.includes(10, 30), "the path contains the point 10,30"
    ok path.includes(30, 30), "the path contains the point 30,30"
    path.destroy()
    path = new swGame.Path [291, 43], [247, 43], [247, 43], [199, 43], [199, -5]
    path.simplify()
    equal 3, path.length(), "path simplified, 2 segments removed"
    ok !path.includes(247, 43), "the path contains the point 247,43"
    ok path.includes(291, 43), "the path contains the point 291,43"
    ok path.includes(199, 43), "the path contains the point 199,43"
    #roundHack not good with negative values
    #ok path.includes(199, -6), "the path contains the point 199,-5"
    path.destroy()
    path = new swGame.Path [10, 0], [10, 10], [0, 10], [0, 0], [2, 0], [2, 8], [6, 8], [6, 0]
    path.simplify()
    equal 8, path.length(), "path simplified, 0 segment removed"
    path.destroy()
  QUnit.test prefix+".calculatePx2", ->
    path = new swGame.Path [0, 0], [100, 0], [100, 100], [0, 100]
    equal 100*100, path.calculatePx2()
    path = new swGame.Path [0, 0], [100, 100], [0, 100]
    equal 100*100/2, path.calculatePx2()
    path.destroy()
  QUnit.test prefix+".getIntPathAndFreeExtPath", ->
    pt = swGame.Point.make 0,0
    intPath = [pt, swGame.Point.make(100, 0), swGame.Point.make(100, 100), swGame.Point.make(0, 100)]
    extPath = [pt, swGame.Point.make(50, 0), swGame.Point.make(50, 10)]
    path = new swGame.Path [1,1], [2,2], [3, 3]
    path.getIntPathAndFreeExtPath intPath, extPath
    equal(pt.status, "in use") for pt in intPath
    equal extPath[0].status, "in use"
    equal extPath[1].status, "free"
    equal extPath[2].status, "free"
    path.destroy()
  QUnit.test prefix+".reset", ->
    path = new swGame.Path [291, 43], [247, 43], [247, 43], [199, 43], [199, -5]
    path.reset()
    equal 0, path.length()
  QUnit.test prefix+".crossesPath", ->
    p = new swGame.Path [319,  -5], [319,  27], [239,  27], [239,  199], [303,  199]
    pa = [swGame.Point.make(285,  105), swGame.Point.make(335,  175), swGame.Point.make(334,  101), swGame.Point.make(360,  135)]
    ok !p.crossesPath(pa), "Check that the opened path "+p.toString()+" does not cross this point array: "+pa.toString()
    ok p.crossesPath(pa, true), "Check that the closed path "+p.toString()+" does not cross this point array: "+pa.toString()
    papt = papt.unmake() for papt in pa
    p.destroy()
    p = new swGame.Path [305, 145], [335, 175], [334, 101], [360, 135]
    pa = [swGame.Point.make(303,  199), swGame.Point.make(319,  -5)]
    ok p.crossesPath(pa), "Check that the path "+p.toString()+" crosses this point array: "+pa.toString()
    papt = papt.unmake() for papt in pa
    p.destroy()
    p = new swGame.Path [0, 0], [630, 0], [630, 290], [0, 290]
    pa = [swGame.Point.make(628,  152), swGame.Point.make(636,  152)]
    ok p.crossesPath(pa), "Check that the path "+p.toString()+" crosses this point array: "+pa.toString()
    papt = papt.unmake() for papt in pa
    p.destroy()
  QUnit.test prefix+".getIntersection", ->
    p = new swGame.Path [319,  -5], [319,  27], [239,  27], [239,  199], [303,  199]
    pa = [swGame.Point.make(285,  105), swGame.Point.make(335,  175), swGame.Point.make(334,  101), swGame.Point.make(360,  135)]
    res = p.getIntersection(pa)
    ok !res.intersection, "Check that the opened path "+p.toString()+" does not cross this point array: "+pa.toString()
    res = p.getIntersection(pa, true)
    equal res.intersection.x, 308, "Check that the closed path "+p.toString()+" does not cross this point array: "+pa.toString()
    equal res.intersection.y, 137, "Check that the closed path "+p.toString()+" does not cross this point array: "+pa.toString()
    res.intersection.unmake()
    papt = papt.unmake() for papt in pa
    p.destroy()
  QUnit.test prefix+".each", ->
    p = new swGame.Path [0,0],[10,0],[10,10],[0,10]
    res = []
    p.each (pt, nextPt, i) ->
      res.push pt.x+"x"+pt.y+"-"+nextPt.x+"x"+nextPt.y+"@"+i
    equal res.join(","), "0x0-10x0@0,10x0-10x10@1,10x10-0x10@2"
  QUnit.test prefix+".eachClosed", ->
    p = new swGame.Path [0,0],[10,0],[10,10],[0,10]
    res = []
    p.eachClosed (pt, nextPt, i) ->
      res.push pt.x+"x"+pt.y+"-"+nextPt.x+"x"+nextPt.y+"@"+i
    equal res.join(","), "0x0-10x0@0,10x0-10x10@1,10x10-0x10@2,0x10-0x0@3"
  QUnit.test prefix+".eachBreak", ->
    p = new swGame.Path [0,0],[10,0],[10,10],[0,10]
    res = []
    p.eachBreak (pt, nextPt, i) ->
      res.push pt.x+"x"+pt.y+"-"+nextPt.x+"x"+nextPt.y+"@"+i
    equal res.join(","), "0x0-10x0@0"
    res = []
    p.eachBreak (pt, nextPt, i) ->
      res.push pt.x+"x"+pt.y+"-"+nextPt.x+"x"+nextPt.y+"@"+i
      false
    equal res.join(","), "0x0-10x0@0,10x0-10x10@1,10x10-0x10@2"
  QUnit.test prefix+".eachClosedBreak", ->
    p = new swGame.Path [0,0],[10,0],[10,10],[0,10]
    res = []
    p.eachClosedBreak (pt, nextPt, i) ->
      res.push pt.x+"x"+pt.y+"-"+nextPt.x+"x"+nextPt.y+"@"+i
    equal res.join(","), "0x0-10x0@0"
    res = []
    p.eachClosedBreak (pt, nextPt, i) ->
      res.push pt.x+"x"+pt.y+"-"+nextPt.x+"x"+nextPt.y+"@"+i
      false
    equal res.join(","), "0x0-10x0@0,10x0-10x10@1,10x10-0x10@2,0x10-0x0@3"
  QUnit.test prefix+".getCenterOfMass", ->
    p = new swGame.Path [0,0],[1000,0],[1000,1000],[0,1000]
    cm = p.getCenterOfMass()
    equal cm.x, 500
    equal cm.y, 500
    cm.unmake
    p.reset()
    p = new swGame.Path [100,100],[200,100],[200,200],[100,200]
    cm = p.getCenterOfMass()
    equal cm.x, 150
    equal cm.y, 150
    cm.unmake
    p.reset()
  QUnit.test prefix+".findPointOnPath", ->
    p = new swGame.Path [10,0],[20,0],[20,10],[30,10],[30,20],[20,20],[20,30],[10,30],[10,20],[0,20],[0,10],[10,10]
    pt = swGame.Point.make(15, 0)
    equal p.findPointOnPath(pt), 0 
    pt.init(5, 10)
    equal p.findPointOnPath(pt), 10
    pt.init(10, 5)
    equal p.findPointOnPath(pt), 11
    pt.init(15, 15)
    equal p.findPointOnPath(pt), null
    pt.unmake()
  QUnit.test prefix+".contains", ->
    p = new swGame.Path [10,0],[20,0],[20,10],[30,10],[30,20],[20,20],[20,30],[10,30],[10,20],[0,20],[0,10],[10,10]
    pt = swGame.Point.make 0, 30
    ok !p.contains(pt)
    pt.unmake()
    p.reset()

