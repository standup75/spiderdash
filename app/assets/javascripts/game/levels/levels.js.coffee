swGame.level = do ->
  "use strict"
  checkpoint = null
  level = null
  isDemo = true
  enemyCount = 0
  killCount = 0
  initLevel = (_isDemo) ->
    enemyCount = 0
    killCount = 0
    level = checkpoint.level
    isDemo = _isDemo
    buildLevel()
    pubsub.publish "newLevel", checkpoint, isDemo
    player = createSprite({name:"Player"}) unless isDemo or checkpoint.kind is swGame.globals.CHECKPOINT_BONUS_LEVEL
    level.startPath.drawLevel level
    initBonus()
    initSprites()
    secretGoalOrTutorial player
    pubsub.publish "levelReady", checkpoint, isDemo
  buildLevel = ->
    if not level.startPath
      level.tileWidth = Math.ceil swGame.globals.width / (level.tileCountX + 2)
      level.tileHeight = Math.ceil swGame.globals.height / (level.tileCountY + 2)
      pathBuilder = new swGame.PathBuilder level
      level.startPath = new swGame.Path
      level.startPath.init.apply level.startPath, pathBuilder.makePath()
      level.startSurface = level.startPath.calculatePx2()
  initSprites = ->
    if level.sprites
      createSprite(sprite) for sprite in level.sprites
    null
  initBonus = ->
    if level.bonus
      for bonu in level.bonus
        createSprite(bonu)
    null
  secretGoalOrTutorial = (player) ->
    unless isDemo
      worldIndex = swGame.world.getWorldIndex()
      if hasSecretGoal()
        swGame.secretGoals[worldIndex]()
        level.hasSecretGoal = true
      else
        swGame.sequence.start("level#{worldIndex}_#{level.index}", player) unless level.hasTried
        level.hasTried = true
  hasSecretGoal = ->
    hint = swGame.world.getHint()
    if hint and not swGame.world.isBonusLevelUnlocked()
      targetLevelIndex = parseInt(hint.substr(-2,2).replace(";", ""), 10)
      levelCount = swGame.world.getLevelCount()
      hasEnoughStars = swGame.profile.getWorldStarCount(swGame.world.getWorldIndex()) + 3 >= levelCount * 3
      return true if level.index == targetLevelIndex and hasEnoughStars
    false
  createSprite = (sprite) ->
    spriteSettings = sprite.options || {}
    spriteSettings.x = level.tileWidth * (sprite.x + 1.5)
    spriteSettings.y = level.tileHeight * (sprite.y + 1.5)
    spriteSettings.level_speed = level.speed
    swGame[sprite.name].make(spriteSettings)
  destroy = ->
    level = null
    pubsub.publish "killSprites"
  duplicateSprite = (name, options) ->
    swGame[name].make(options)
  showSplashLevel = ->
    destroy()
    checkpointIndex = swGame.profile.getLastAvailableCheckpointIndex(0)
    checkpoint = swGame.world.findNextCp checkpointIndex, 0
    unless checkpoint
      checkpointIndex = 0
      w = swGame.gameData.worlds[0]
      checkpointIndex++ while w.checkpoints[checkpointIndex].kind isnt swGame.globals.CHECKPOINT_LEVEL
      checkpoint = w.checkpoints[checkpointIndex] 
    level = checkpoint.level
    pubsub.publish "playTheme"
    swGame.ui.setBackgroundColor swGame.gameData.worlds[0].color
    initLevel true
  retry = -> 
    pubsub.publish "killSprites"
    pubsub.publish "playGameMusic", swGame.world.getWorldIndex(), true
    initLevel()
  removeEnemy = (sprite) ->
    if sprite.isEnemy
      killCount++
      swGame.profile.levelCompleted() if enemyCount is killCount

  pubsub.subscribe "duplicateSprite", duplicateSprite
  pubsub.subscribe "displayWorldMap", destroy
  pubsub.subscribe "play", destroy
  pubsub.subscribe "retry", retry
  pubsub.subscribe "showHome", showSplashLevel
  pubsub.subscribe "someoneJustDied", removeEnemy

  gotoLevel: (checkpointIndex, worldIndex) ->
    pubsub.publish "playGameMusic", worldIndex, true
    checkpoint = swGame.gameData.worlds[worldIndex].checkpoints[checkpointIndex]
    initLevel()
  gotoSecretLevel: (worldIndex) ->
    isDemo = false
    world = swGame.gameData.worlds[worldIndex]
    checkpoint = swGame.world.getSecretCheckpoint(world)
    level = checkpoint.level
    level.isSecret = true
    buildLevel()
    pubsub.publish "newLevel", checkpoint, isDemo
    initSprites()
    initBonus()
    level.startPath.drawLevel level
    pubsub.publish "levelReady", checkpoint, isDemo
  showLevelForEditor: ->
    checkpoint = swGame.gameData.worlds[0].checkpoints[0]
    level = checkpoint.level
    initLevel true
  showSplashLevel: showSplashLevel
  isPlaying: -> level and not isDemo
  getCurrentCheckpoint: -> checkpoint
  addEnemy: -> enemyCount++
  getEnemyCount: -> enemyCount
  getKillCount: -> killCount
  nextAvailableLevel: (world, index) ->
    index++ while world.cp[index] and world.cp[index].kind isnt swGame.globals.CHECKPOINT_LEVEL
    world.cp[index].level
