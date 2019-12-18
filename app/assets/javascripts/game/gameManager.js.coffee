swGame.gameManager = do ->
  lastTime = new Date().getTime()
  paused = false
  manualPause = false
  initIsDone = false
  imagesAreLoaded = false
  isEditor = false

  animloop = ->
    requestAnimFrame(animloop) if !paused
    newTime = new Date().getTime()
    timeElapsed = newTime - lastTime
    # more than 400 ms, maybe the window just lost focus, don't try to catch up!
    if timeElapsed > swGame.settings.cycle
      lastTime = newTime
      swGame.ui.clearBoard()
      pubsub.publish "repaint"

  resume = (isManual) ->
    if isManual or not manualPause
      paused = false
      manualPause = false
      animloop()
  pause = (isManual) ->
    manualPause = true if isManual
    paused = true
  togglePause = ->
    if paused and manualPause
      pubsub.publish "resume", true
    else
      pubsub.publish "pause", true
  imagesLoaded = ->
    imagesAreLoaded = true
    start() if initIsDone
  setEditorMode = -> isEditor = true
  start = ->
    if isEditor
      swGame.level.showLevelForEditor()
    else
      swGame.level.showSplashLevel()
    # main call
    animloop()
        
  pubsub.subscribe "resume", resume
  pubsub.subscribe "pause", pause
  pubsub.subscribe "togglePause", togglePause
  pubsub.subscribe "imagesLoaded", imagesLoaded
  pubsub.subscribe "editorMode", setEditorMode

  # who ever is last starts the animation loop: loading the images or the init event
  init = (event) ->
    return if not document.getElementById "canvas"
    swGame.images.preloadGameDataImages()
    swGame.globals.init()
    pubsub.publish "init"
    initIsDone = true
    start() if imagesAreLoaded

  if swGame.device.mobile
    document.addEventListener "deviceready", init, false
    # We don't need scrolling and swipe, so we deactivate it (useful to avoid bouncing effect on ios)
    document.addEventListener "touchmove", (ev) -> ev.preventDefault()
  else
    window.addEventListener "load", init, false

  isPaused: -> paused
  cheat: ->
    gd = swGame.gameData
    lastCheckpoints = []
    stars = []
    unlockWorlds = []
    for world in gd.worlds
      worldStars = []
      lastLevelIndex = 0
      for cp in world.checkpoints
        starCount = null
        if cp.kind is 0
          starCount = 3
          lastLevelIndex = cp.index if cp.level
        worldStars.push starCount
      stars.push worldStars
      lastCheckpoints.push(lastLevelIndex)
      unlockWorlds.push true
    gp = JSON.parse localStorage.gameProgress
    gp.lastCheckpoints = lastCheckpoints
    gp.stars = stars
    gp.unlockWorlds = unlockWorlds
    localStorage.gameProgress = JSON.stringify gp
