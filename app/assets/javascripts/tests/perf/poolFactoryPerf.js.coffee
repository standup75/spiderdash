window.swPerfs ?= []

window.swPerfs.push
  name: "Make and unmake Points"
  test: ->
    pts = []
    pts.push(swGame.Point.make(n, n)) for n in [1..50]
    pts.pop().unmake() for n in [1..50]
    pts.push(swGame.Point.make(n, n)) for n in [1..100]
    pts.pop().unmake() for n in [1..100]
    pts.push(swGame.Point.make(n, n)) for n in [1..100]
    pts.pop().unmake() for n in [1..100]
    pts.push(swGame.Point.make(n, n)) for n in [1..150]
    pts.pop().unmake() for n in [1..150]

window.swPerfs.push
  name: "Make and unmake Segments"
  test: ->
    pts = []
    pts.push(swGame.Segment.make([n, n], [n+10, n+10])) for n in [1..50]
    pts.pop().unmake() for n in [1..50]
    pts.push(swGame.Segment.make([n, n], [n+10, n+10])) for n in [1..100]
    pts.pop().unmake() for n in [1..100]
    pts.push(swGame.Segment.make([n, n], [n+10, n+10])) for n in [1..100]
    pts.pop().unmake() for n in [1..100]
    pts.push(swGame.Segment.make([n, n], [n+10, n+10])) for n in [1..150]
    pts.pop().unmake() for n in [1..150]
    