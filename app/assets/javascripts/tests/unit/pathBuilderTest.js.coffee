window.swTests ?= []

window.swTests.path_builder = ->
  prefix = "swGame.PathBuilder"
  getLevel = ->
    tileCountX: 5
    tileCountY: 5
    tiles:
      0:
        0:true
        1:true
        2:true
        3:true
        4:true
      1:
        0:true
      2:
        0:true
      3:
        0:true
      4:
        0:true
  QUnit.test prefix+".path", ->
    level = getLevel()
    swGame.globals.width = 320
    swGame.globals.height = 640
    pathBuilder = new swGame.PathBuilder(level)
    path = pathBuilder.makePath()
    equal path.length, 4
    equal path[0].x, 64
    equal path[0].y, 128
    equal path[1].x, 256
    equal path[1].y, 128
    equal path[2].x, 256
    equal path[2].y, 512
    equal path[3].x, 64
    equal path[3].y, 512
  QUnit.test prefix+".path with force init", ->
    level = getLevel()
    swGame.globals.width = 320
    swGame.globals.height = 640
    pathBuilder = new swGame.PathBuilder(level)
    pathBuilder.makePath()
    level.tiles[1][1] = true
    path = pathBuilder.makePath()
    equal path.length, 4
    path = pathBuilder.makePath(true)
    equal path.length, 6
    equal path[0].x, 128
    equal path[0].y, 128
    equal path[1].x, 256
    equal path[1].y, 128
    equal path[2].x, 256
    equal path[2].y, 512
    equal path[3].x, 64
    equal path[3].y, 512
    equal path[4].x, 64
    equal path[4].y, 256
    equal path[5].x, 128
    equal path[5].y, 256
    