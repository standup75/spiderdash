swGame.world = do ->
  "use strict"

  unlockedColor = "#44bb66"
  lockedColor = "#888888"
  precision = 0.5
  world = backgroundImage = destination = worldPlayer = nextCp = previousCp = unlockWorldCount = null
  cellWidth = cellHeight = checkpointIndex = clickAreaWidth = clickAreaHeight = 0
  starImage = swGame.images.add "#{swGame.settings.assetsPath}/world_map/star.png"
  lockedImage = swGame.images.add "#{swGame.settings.assetsPath}/world_map/level_locked.png"
  bonusImage = swGame.images.add "#{swGame.settings.assetsPath}/world_map/level_bonus.png"
  unlockedImage = swGame.images.add "#{swGame.settings.assetsPath}/world_map/level_unlocked.png"
  worldUnlockedImage = swGame.images.add "#{swGame.settings.assetsPath}/world_map/world_unlocked.png"
  worldLockedImage = swGame.images.add "#{swGame.settings.assetsPath}/world_map/world_locked.png"
  initWorldMap = (worldIndex, isComingBack) ->
    pubsub.publish "resume", true
    if not world or (worldIndex >= 0 and worldIndex isnt world.index)
      previousWorldIndex = world.index if isComingBack
      setWorld worldIndex
      checkpointIndex = findWorldPlayerCpIndex previousWorldIndex, isComingBack
      initWorldPlayer()
    else
      worldPlayer.reactivate()
    displayWorldMap()
    resetNextAndPreviousCp()
    swGame.ui.showPlayerInfo true
  setWorld = (worldIndex = 0) ->
    world = swGame.gameData.worlds[worldIndex]
    cellWidth = swGame.globals.width / world.gridWidth
    cellHeight = swGame.globals.height / world.gridHeight
    clickAreaWidth = Math.max lockedImage.width, cellWidth
    clickAreaHeight = Math.max lockedImage.height, cellHeight
  findWorldPlayerCpIndex = (worldIndex, isComingBack) ->
    if isComingBack
      for cp in world.checkpoints
        return cp.index if cp.linkToWorldIndex is worldIndex
    else
      0
  initWorldPlayer = ->
    worldPlayer = worldPlayer?.unmake()
    [x, y] = getLocation(world.checkpoints[checkpointIndex])
    worldPlayer = swGame.WorldPlayer.make 
      x: x + cellWidth / 2
      y: y + cellHeight / 2
      cellWidth: cellWidth
      cellHeight: cellHeight
      clickAreaWidth: clickAreaWidth
      clickAreaHeight: clickAreaHeight
  displayWorldMap = ->
    paint()
    pubsub.publish "playMapMusic", world.index, true
    # the delay is to avoid unwanted click coming for the previous screen
    setTimeout ->
      pubsub.subscribe "touch", touchSelectCheckpoint
      pubsub.subscribe "select", keyboardSelectCheckpoint
      pubsub.subscribe "turn", gotoCheckpoint
    , 250
  resetNextAndPreviousCp = ->
    nextCp = findNextCp(1, checkpointIndex + 1)
    previousCp = findNextCp(-1, checkpointIndex - 1)
  checkForNewWorld = ->
    _unlockWorldCount = 0
    for cp in world.checkpoints
      if cp.kind is swGame.globals.CHECKPOINT_WORLD_GATE and isWorldGateOpen(cp)
        _unlockWorldCount++ 
        iconPicture = swGame.gameData.worlds[cp.linkToWorldIndex].iconPicture
        [x, y] = getLocation cp
        x = Math.round x - iconPicture.width / 2 + 20
        y = Math.round y - 3 * iconPicture.height / 4
        if unlockWorldCount? and _unlockWorldCount > unlockWorldCount
          new swGame.LocalBubbles Math.round(x + iconPicture.width / 2), Math.round(y + iconPicture.height / 2)
          unlockWorldIcon iconPicture, x, y, 75
        else
          swGame.globals.ctxBackground.drawImage iconPicture, x, y
    unlockWorldCount = _unlockWorldCount
  unlockWorldIcon = (image, x, y, totalCycleCount) ->
    ctx = swGame.globals.ctx
    cycleCount = 1
    repaint = ->
      ctx = swGame.globals.ctxBackground if cycleCount is totalCycleCount
      ctx.save()
      scale = cycleCount / totalCycleCount
      ctx.translate Math.round(x + image.width / 2), Math.round(y + image.height)
      ctx.globalAlpha = scale
      ctx.scale scale, scale
      ctx.rotate scale * 2 * Math.PI
      ctx.drawImage image, Math.round(- image.width / 2), Math.round(- image.height * scale)
      ctx.restore()
      if cycleCount++ is totalCycleCount
        pubsub.unsubscribe("repaint", repaint)
        drawCheckPoints()
    pubsub.subscribe "repaint", repaint
  keyboardSelectCheckpoint = ->
    return if checkpointIndex is 0 and world?.index is 0
    selectCheckpoint world.checkpoints[checkpointIndex]
  touchSelectCheckpoint = (x, y) ->
    cp = getCheckpointAt x, y
    selectCheckpoint(cp) if cp isnt false
  selectCheckpoint = (cp) ->
    if cp.kind is swGame.globals.CHECKPOINT_WORLD_GATE and not isWorldGateOpen(cp)
      [x, y] = getLocation cp
      worldName = swGame.gameData.worlds[cp.linkToWorldIndex].name
      missingStarCount = starCountRequiredForGateAt(cp) - swGame.profile.getWorldStarCount(world.index)
      swGame.ui.showLockedGate worldName, missingStarCount, x + cellWidth / 2, y + cellHeight / 2
    else
      worldPlayer.setGoalAndFall getWorldPlayerPath(cp.index), cp.kind is swGame.globals.CHECKPOINT_WORLD_END
      checkpointIndex = cp.index
  isWorldGateOpen = (cp) -> swGame.profile.getWorldStarCount(world.index) >= starCountRequiredForGateAt(cp)
  starCountRequiredForGateAt = (cp) -> (world.checkpoints[cp.index-1].level?.index - 2) * 3
  getWorldPlayerPath = (goalCpi) ->
    worldPlayerPath = []
    pushNewCheckpointInWorldPlayerPath = (force) ->
      cp = world.checkpoints[checkpointIndex]
      if force or cp.kind is swGame.globals.CHECKPOINT_LEVEL
        [x, y] = getLocation cp
        worldPlayerPath.push swGame.Point.make(x + clickAreaWidth / 2, y + clickAreaHeight / 2)

    if checkpointIndex < goalCpi
      while checkpointIndex++ < goalCpi - 1
        pushNewCheckpointInWorldPlayerPath()
    else if goalCpi < checkpointIndex
      while checkpointIndex-- > goalCpi + 1
        pushNewCheckpointInWorldPlayerPath()
    pushNewCheckpointInWorldPlayerPath(true)
    worldPlayerPath    
    
  getCheckpointAt = (x, y) ->
    res = false
    index = 0
    while (cp = world.checkpoints[index++]) and (res is false)
      res = cp if clickedOn(cp, x, y)
    if res is false
      cp = swGame.world.getSecretCheckpoint world
      res = cp if clickedOn(cp, x, y)
    res
  clickedOn = (cp, x, y) ->
    (x > cellWidth * (cp.x - precision)) and (x < (clickAreaWidth + cellWidth * (cp.x + precision))) and\
    (y > cellHeight * (cp.y - precision)) and (y < (clickAreaHeight + cellHeight * (cp.y + precision))) and\
    isClickable(cp, world.index)
  isClickable = (cp, worldIndex) ->
    (cp.kind is swGame.globals.CHECKPOINT_BONUS_LEVEL and isBonusLevelUnlocked(worldIndex)) or\
    cp.kind isnt swGame.globals.CHECKPOINT_GAME_START_POS and\
    ((cp.kind is swGame.globals.CHECKPOINT_LEVEL and swGame.profile.isReached(worldIndex, cp.index)) or\
    cp.kind is swGame.globals.CHECKPOINT_WORLD_GATE or cp.kind is swGame.globals.CHECKPOINT_WORLD_BEGIN or\
    (isComplete(worldIndex) and cp.kind is swGame.globals.CHECKPOINT_WORLD_END))
  getLastLevelIndex = (worldIndex) ->
    res = 0
    for cp in swGame.gameData.worlds[worldIndex].checkpoints
      res = cp.index if cp.kind is swGame.globals.CHECKPOINT_LEVEL
    res
  isComplete = (worldIndex) -> swGame.profile.getLastAvailableCheckpointIndex(worldIndex) >= getLastLevelIndex(worldIndex)
  paint = ->
    swGame.ui.clearAll()
    swGame.ui.setBackgroundColor world.color
    swGame.globals.ctxBackground.drawImage world.mapPicture, 0, 0
    checkForNewWorld() if world.index is 0
    drawCheckPoints()
  drawCheckPoints = ->
    index = world.checkpoints.length
    drawCheckPoint(world.checkpoints[index]) while index-- > 0
  drawCheckPoint = (cp) ->
    if cp.kind is swGame.globals.CHECKPOINT_GAME_START_POS
      swGame.mustache.hide()
      return
    starCount = 0
    ctx = swGame.globals.ctxBackground
    ctx.save()
    [x, y] = getLocation(cp)
    if cp.kind is swGame.globals.CHECKPOINT_BONUS_LEVEL
      if isBonusLevelUnlocked()
        image = bonusImage
      else
        return
    else    
      if cp.kind is swGame.globals.CHECKPOINT_WORLD_GATE and isWorldGateOpen(cp)
        image = worldUnlockedImage
      else if cp.kind in [swGame.globals.CHECKPOINT_WORLD_BEGIN, swGame.globals.CHECKPOINT_WORLD_END, swGame.globals.CHECKPOINT_WORLD_GATE]
        image = worldLockedImage
      else
        if isLevelUnlock cp
          starCount = swGame.profile.getStarCount world.index, cp.index
          image = unlockedImage
        else
          image = lockedImage
    ctx.drawImage image, Math.round(x + (cellWidth - image.width) * 0.5), Math.round(y)
    ctx.restore()
    drawStars starCount, x, y
    swGame.mustache.drawMustache(world.index, x, y) if cp.kind is swGame.globals.CHECKPOINT_WORLD_END
  getNextLevel = (cpIndex) ->
    while (cp = world.checkpoints[++cpIndex])
      return cp if cp.kind is swGame.globals.CHECKPOINT_LEVEL
  isLevelUnlock = (cp) -> cp.index <= swGame.profile.getLastAvailableCheckpointIndex(world.index)
  isBonusLevelUnlocked = (worldIndex = world.index) -> swGame.profile.getGameProgress().unlockWorlds?[worldIndex]
  getLocation = (cp) -> [cellWidth * cp.x, cellHeight * cp.y]
  deactivateUi = ->
    pubsub.unsubscribe "touch", touchSelectCheckpoint
    pubsub.unsubscribe "select", keyboardSelectCheckpoint
    pubsub.unsubscribe "turn", gotoCheckpoint
  drawStars = (count, x, y) ->
    ctx = swGame.globals.ctxBackground
    x += 6 + cellWidth * 0.5
    y += 6
    if count == 1
      ctx.drawImage starImage, x - 18, y - 40
    else if count == 2
      ctx.drawImage starImage, x - 38, y - 34
      ctx.drawImage starImage, x + 2, y - 34
    else if count == 3
      ctx.drawImage starImage, x - 18, y - 40
      ctx.drawImage starImage, x - 52, y - 28
      ctx.drawImage starImage, x + 16, y - 28
  gotoCheckpoint = (x, y) ->
    return if worldPlayer.goals
    nextCp = findNextCp(1, 1) if not nextCp and not previousCp
    tryAndGoTo(nextCp, x, y) or tryAndGoTo(previousCp, x, y)
  tryAndGoTo = (cp, x, y) ->
    return unless cp
    cpX = cp.x * cellWidth
    cpY = cp.y * cellHeight
    wpl = worldPlayer.location
    if (cpX > wpl.x and x is 1) or (cpX < wpl.x and x is -1) or\
    (cpY > wpl.y and y is 1) or (cpY < wpl.y and y is -1)
      nextCp = findNextCp 1, cp.index + 1
      previousCp = findNextCp -1, cp.index - 1
      checkpointIndex = cp.index
      goal = [swGame.Point.make(cp.x * cellWidth + clickAreaWidth / 2, cp.y * cellHeight + clickAreaHeight / 2)]
      worldPlayer.setGoal goal, cp.kind is swGame.globals.CHECKPOINT_WORLD_END
      true
    else
      false
  findNextCp = (direction, index, _world = world) ->
    while (cp = _world.checkpoints[index]) and not isClickable(cp, _world.index) and _world.checkpoints[index + 1]
      if cp.kind == swGame.globals.CHECKPOINT_LEVEL and not swGame.profile.isReached(_world.index, cp.index)
        return null 
      index += direction 
    return cp
  reset = ->
    deactivateUi()
    world = null
    worldPlayer = worldPlayer?.unmake()

  pubsub.subscribe "displayWorldMap", initWorldMap
  pubsub.subscribe "play", initWorldMap
  pubsub.subscribe "showHome", reset
  ###
  # debug: show click area on the checkpoints
  pubsub.subscribe "pause", ->
    ctx = swGame.globals.ctxBackground
    ctx.save()
    ctx.strokeStyle = "#F77"
    ctx.lineWidth = 2
    for cp in world.checkpoints
      ctx.strokeRect cellWidth * (cp.x - precision), cellHeight * (cp.y - precision), clickAreaWidth + 2 * precision * cellWidth, clickAreaHeight + 2 * precision * cellHeight
    ctx.restore()
  ###
  gotoLevel: ->
    deactivateUi()
    cp = world.checkpoints[checkpointIndex]
    switch cp.kind
      when swGame.globals.CHECKPOINT_WORLD_BEGIN, swGame.globals.CHECKPOINT_WORLD_END
        initWorldMap cp.linkToWorldIndex, true
        pubsub.publish "worldSwitch"
      when swGame.globals.CHECKPOINT_WORLD_GATE
        initWorldMap cp.linkToWorldIndex
        pubsub.publish "worldSwitch"
        # green mustach sequence to show only if no level have been finished on the world 1: Forest
        if cp.linkToWorldIndex is 1 and swGame.profile.getLastAvailableCheckpointIndex(1) is 1
          swGame.sequence.start "greenMustache", null, ["newLevel", "worldSwitch"]
      when swGame.globals.CHECKPOINT_LEVEL, swGame.globals.CHECKPOINT_BONUS_LEVEL
        swGame.ui.showPlayerInfo false
        swGame.level.gotoLevel checkpointIndex, world.index
  getWorldIndex: -> world?.index
  getHint: -> world?.hint
  getLevelCount: ->
    return world.levelCount if world.levelCount
    count = 0
    for cp in world.checkpoints
      count++ if cp.kind is swGame.globals.CHECKPOINT_LEVEL
    world.levelCount = count
  getStarCountUntil: (_checkpointIndex) ->
    starCount = getStarCount _checkpointIndex
    starCount += getStarCount(_checkpointIndex) while _checkpointIndex--
    starCount
  getSecretCheckpoint: (world) ->
    for cp in world.checkpoints
      return cp if cp.kind is swGame.globals.CHECKPOINT_BONUS_LEVEL
    false
  isBonusLevelUnlocked: isBonusLevelUnlocked
  findNextCp: (_checkpointIndex, worldIndex, direction = 1) ->
    worldIndex = if worldIndex? then worldIndex else world?.index || 0
    findNextCp direction, _checkpointIndex, swGame.gameData.worlds[worldIndex]

