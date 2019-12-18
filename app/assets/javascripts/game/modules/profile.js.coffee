swGame.profile = do ->
  "use strict"
  remainingSurface = startSurface = currentCheckpointIndex = star = percentClosed = 0
  gameProgress = isCompleted = null
  emptyGame = ->
    score: 0
    lastCheckpoints: [0]
    stars: []
    unlockWorlds: []
    mustaches: []
  getPointsForPercent = (percent) ->
    if percent<2
      0
    else if percent<5
      25
    else if percent<10
      100
    else if percent<20
      400
    else if percent<30
      650
    else if percent<50
      1200
    else 1800
  newLevel = (cp) ->
    percentClosed = 0
    isCompleted = false
    remainingSurface = startSurface = cp.level.startSurface
    currentCheckpointIndex = cp.index
    star = 0
  pathUpdated = (closedPathCenterOfMass) ->
    surface = startSurface
    newRemainingSurface = swGame.globals.path.calculatePx2()
    surfaceClosed = surface-newRemainingSurface
    percentClosed = Math.round((surfaceClosed * 100) / surface)
    swGame.ui.setProgress percentClosed
    points = getPointsForPercent ((remainingSurface - newRemainingSurface)*100) / surface
    if points
      swGame.profile.updateScore points
      swGame.ui.showPointsOnBoard points, closedPathCenterOfMass
    remainingSurface = newRemainingSurface
    swGame.profile.levelCompleted(percentClosed) if percentClosed >= swGame.settings.percentFinish
  resetGameProgress = ->
    if localStorage.gameProgress and localStorage.gameProgress.length>0
      gameProgress = JSON.parse(localStorage.gameProgress)
      gameProgress = emptyGame() unless gameProgress and gameProgress.lastCheckpoints and gameProgress.lastCheckpoints.length
    else
      gameProgress = emptyGame()
  restoreGameProgress = ->
    resetGameProgress()
    swGame.profile.setSound isSoundOn()
    swGame.profile.setSoundFx isSoundFxOn()
  saveStars = (worldIndex) ->
    gameProgress.stars[worldIndex]=[] if not gameProgress.stars[worldIndex]
    worldStars = gameProgress.stars[worldIndex]
    starCount = worldStars[currentCheckpointIndex]
    worldStars[currentCheckpointIndex] = star if not starCount or starCount<star
  saveProgress = ->
    gpString = JSON.stringify(gameProgress)
    localStorage.gameProgress = gpString
    if localStorage.userId
      swGame.helpers.ajax
        url: "/users/#{localStorage.userId}/game_progress.json"
        type: "POST"
        params:
          gameProgress: encodeURIComponent(gpString)
  isSoundOn = -> if localStorage.sound? then localStorage.sound is "true" else true
  isSoundFxOn = -> if localStorage.soundFx? then localStorage.soundFx is "true" else true

  pubsub.subscribe "retry", resetGameProgress
  pubsub.subscribe "newLevel", newLevel
  pubsub.subscribe "pathUpdated", pathUpdated
  pubsub.subscribe "init_done", restoreGameProgress
  pubsub.subscribe "showHome", restoreGameProgress
  pubsub.subscribe "editorMode", ->
    pubsub.unsubscribe "newLevel", newLevel
    pubsub.unsubscribe "pathUpdated", pathUpdated

  updateScore: (points) ->
    gameProgress.score += points
    swGame.ui.setScore gameProgress.score
  addStar: -> star++
  getGameProgress: -> gameProgress
  getScore: -> if gameProgress then gameProgress.score else 0
  restoreGameProgress: -> restoreGameProgress()
  isFirstTry: -> gameProgress and gameProgress.lastCheckpoints[0] is 0
  setSound: (switchOn) ->
    localStorage.sound = switchOn
    pubsub.publish "switchMusic", switchOn
  setSoundFx: (switchOn) ->
    localStorage.soundFx = switchOn
    pubsub.publish "switchSoundFx", switchOn
  unlockBonusLevel: ->
    gameProgress.unlockWorlds[swGame.world.getWorldIndex()] = true
    saveProgress()
  getLastWorldIndex: -> if gameProgress then gameProgress.lastCheckpoints.length - 1 else 0
  getLastAvailableCheckpointIndex: (worldIndex) ->
    index = gameProgress.lastCheckpoints[worldIndex]
    checkpoints = swGame.gameData.worlds[worldIndex].checkpoints
    if not index
      for cp in checkpoints
        if cp.kind == swGame.globals.CHECKPOINT_LEVEL
          return cp.index
    else
      continue while (cp = checkpoints[++index]) and (cp.kind isnt swGame.globals.CHECKPOINT_LEVEL)
    index
  getStarCount: (worldIndex, checkpointIndex) ->
    starCount = 0
    worldStars = gameProgress.stars[worldIndex]
    starCount = worldStars[checkpointIndex] if worldStars and worldStars[checkpointIndex]
    starCount
  getWorldStarCount: (worldIndex, checkpointIndex) ->
    starCount = 0
    worldStars = gameProgress.stars[worldIndex]
    if worldStars
      for cpStarCount, i in worldStars
        starCount += cpStarCount if cpStarCount
        break if checkpointIndex and i >= checkpointIndex
    starCount
  getRemainingStarCount: (worldIndex) ->
    worldIndex = swGame.world.getWorldIndex() unless worldIndex?
    (swGame.world.getLevelCount() * 3) - swGame.profile.getWorldStarCount(worldIndex)
  isReached: (worldIndex, checkpointIndex) -> checkpointIndex <= swGame.profile.getLastAvailableCheckpointIndex(worldIndex)
  addMustache: (worldIndex) ->
    gameProgress.mustaches.push worldIndex
    saveProgress()
  getMustacheIndex: -> 
    mustachesCount = gameProgress.mustaches?.length
    if mustachesCount
      gameProgress.mustaches[mustachesCount - 1]
    else
      0
  hasMustache: (worldIndex) -> worldIndex in gameProgress.mustaches
  isSoundOn: isSoundOn
  getPercentClosed: -> percentClosed
  levelCompleted: (percentClosed = 0) ->
    # Several things can trigger levelCompleted (>70% or massacre)
    # but we want this function to be executed only once
    return if isCompleted
    isCompleted = true
    worldIndex = swGame.world.getWorldIndex()
    unless swGame.level.getCurrentCheckpoint().level.hasSecretGoal
      lastCheckpoint = gameProgress.lastCheckpoints[worldIndex] || 0
      if currentCheckpointIndex > lastCheckpoint
        gameProgress.lastCheckpoints[worldIndex] = currentCheckpointIndex
      swGame.levelBonus.show star, percentClosed
      saveStars worldIndex
      saveProgress()
    pubsub.publish "playFx", "win"
    pubsub.publish "stopGameMusic"
    pubsub.publish "levelCompleted", worldIndex, currentCheckpointIndex
