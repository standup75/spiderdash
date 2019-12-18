window.swTests ?= []

window.swTests.player = ->
  prefix = "swGame.player"
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
    
    
  QUnit.test "new "+prefix, ->
    p = new swGame.Player
    ok pubsub.isSubscribed "turn", p.turn
    ok pubsub.isSubscribed "touch", p.touch
    ok pubsub.isSubscribed "newLife", p.newLife
    ok pubsub.isSubscribed "ennemyLocated", p.ennemyLocated
    ok pubsub.isSubscribed "isInsidePath_done", p.isInsidePathDone
    ok pubsub.isSubscribed "diedWhileClosingPath", p.diedWhileClosingPath
    ok pubsub.isSubscribed "collision", p.collision
    p.destroy()
  QUnit.test prefix+".turn", ->
    p = getPlayerOnNewPath()
    p.turn swGame.Point.make(1, 0)
    equal p.pathIndex, 1, "going in the same direction in passive move does not change anything"
    equal p.previousPathIndex, 0
    equal p.nextPos.x, 10
    equal p.nextPos.y, 0
    p.turn swGame.Point.make(-1, 0)
    equal p.pathIndex, 0, "going back in passive move reverses the direction"
    equal p.previousPathIndex, 1
    equal p.nextPos.x, 0
    equal p.nextPos.y, 0
    p.turn swGame.Point.make(0, -1)
    equal p.direction, null, "going up in passive move, does not do anything if outside the path"
    p.turn swGame.Point.make(0, 1)
    equal p.direction.y, 1, "going down in passive move, switches to active move if inside the path"
    equal p.direction.x, 0
    dpl = p.drawingPath.path[0]
    equal dpl.x, 5
    equal dpl.y, 0
    p.destroy()
  QUnit.test prefix+"._updateNextSegment", ->
    p = getPlayerOnNewPath()
    p._updateNextSegment()
    equal p.pathIndex, 2
    equal p.previousPathIndex, 1
    equal p.nextPos.x, 10
    equal p.nextPos.y, 10
    p._updateNextSegment()
    equal p.pathIndex, 3
    equal p.previousPathIndex, 2
    equal p.nextPos.x, 0
    equal p.nextPos.y, 10
    p._updateNextSegment()
    equal p.pathIndex, 0
    equal p.previousPathIndex, 3
    equal p.nextPos.x, 0
    equal p.nextPos.y, 0
    p._updateNextSegment()
    equal p.pathIndex, 1
    equal p.previousPathIndex, 0
    equal p.nextPos.x, 10
    equal p.nextPos.y, 0
    p.clockwise = -1
    p._updateNextSegment()
    equal p.pathIndex, 0
    equal p.previousPathIndex, 1
    equal p.nextPos.x, 0
    equal p.nextPos.y, 0
    p._updateNextSegment()
    equal p.pathIndex, 3
    equal p.previousPathIndex, 0
    equal p.nextPos.x, 0
    equal p.nextPos.y, 10
    p._updateNextSegment()
    equal p.pathIndex, 2
    equal p.previousPathIndex, 3
    equal p.nextPos.x, 10
    equal p.nextPos.y, 10
    p._updateNextSegment()
    equal p.pathIndex, 1
    equal p.previousPathIndex, 2
    equal p.nextPos.x, 10
    equal p.nextPos.y, 0
    p.destroy()
  QUnit.test prefix+"._setLocation", ->
    p = getPlayerOnNewPath()
    pt = swGame.Point.make(55, 99)
    p._setLocation pt
    pt = pt.unmake()
    equal p.location.x, 55
    equal p.location.y, 99
    p.destroy()
  QUnit.test prefix+"._passiveMove", ->
    playerMovedEventSent = false
    pubsub.subscribe "playerMoved", ->
      playerMovedEventSent = true
    p = getPlayerOnNewPath()
    p._passiveMove()
    ok playerMovedEventSent, "playerMoved event raised"
    equal p.location.x, 5+p.step, "player has moved"
    equal p.location.y, 0
    p.location.x = 8
    p._passiveMove()
    equal p.location.y, 0, "player has moved to the next segment, going right"
    equal p.location.x, 10, "since step = 4, we also check here that he player is back on the path if he moved a little to far"
    equal p.pathIndex, 2
    equal p.previousPathIndex, 1
    equal p.nextPos.x, 10
    equal p.nextPos.y, 10
    p.pathIndex = 3
    p.previousPathIndex = 2
    p.nextPos.x = 0
    p.nextPos.y = 10
    p.location.x = 2
    p.location.y = 10
    p._passiveMove()
    equal p.location.y, 10, "player has moved to the next segment, going left"
    equal p.location.x, 0, "since step = 4, we also check here that he player is back on the path if he moved a little to far"
    equal p.pathIndex, 0
    equal p.previousPathIndex, 3
    equal p.nextPos.x, 0
    equal p.nextPos.y, 0
    p.pathIndex = 2
    p.previousPathIndex = 1
    p.nextPos.x = 10
    p.nextPos.y = 10
    p.location.x = 10
    p.location.y = 8
    p._passiveMove()
    equal p.location.y, 10, "player has moved to the next segment, going down"
    equal p.location.x, 10, "since step = 4, we also check here that he player is back on the path if he moved a little to far"
    equal p.pathIndex, 3
    equal p.previousPathIndex, 2
    equal p.nextPos.x, 0
    equal p.nextPos.y, 10
    p.pathIndex = 0
    p.previousPathIndex = 3
    p.nextPos.x = 0
    p.nextPos.y = 0
    p.location.x = 0
    p.location.y = 2
    p._passiveMove()
    equal p.location.y, 0, "player has moved to the next segment, going up"
    equal p.location.x, 0, "since step = 4, we also check here that he player is back on the path if he moved a little to far"
    equal p.pathIndex, 1
    equal p.previousPathIndex, 0
    equal p.nextPos.x, 10
    equal p.nextPos.y, 0
    p.destroy()
  QUnit.test prefix+"._activeMove", ->
    p = getPlayerOnNewPath()
    createDrawingPath p
    p._activeMove()
    equal p.location.x, 6, "activeMove up moves the drawing path and the player up"
    equal p.location.y, 2
    p._activeMove()
    equal p.location.x, 6, "activeMove back on the path closes the drawing path and put the player on the path"
    equal p.location.y, 0
    equal p.path.length(), 8
    equal p.drawingPath.length(), 0
    p.step = 5
    p.direction = swGame.Point.make -1, 0
    p._activeMove()
    equal p.drawingPath.length(), 0
    p.destroy()
  QUnit.test prefix+".diedWhileClosingPath", ->
    lifeCount = 5
    swGame.profile.setLifeCount lifeCount
    ctpd = new swGame.Centipede
      factor: 0
    ctpd.repaint() for i in [0..20]
    hp = ctpd.location
    pl = new swGame.Player
    pathCopy = pl.path.getCopy()
    pl.drawingPath.reset()
    pl.drawingPath.push hp.x, hp.y
    pl.drawingPath.push pl.path.path[2].x, pl.path.path[2].y
    pl._resolvePath 2
    ok pl.isDying, "closing the path on a monster kills the player"
    ok pl.path.equal(pathCopy)