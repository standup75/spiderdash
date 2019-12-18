swGame.ui = do ->
  "use strict"
  playBtn = soundBtn = soundFxBtn = playerInfo = logoLayer = skipBtn = pauseBtn = beginKeyLayer = null
  stageIntroLayer = highscoreLayer = unlockSecretLayer = secretUnlockedLayer = gameOverLayer = null
  timer = bgEl = lockedGate = uiControlEl = feedbackLogoEl = null
  newLevel = (cp, isDemo) ->
    displayLevelNumberAndName(cp.level.index, cp.level.name) if not isDemo and not cp.level.hasTried
    swGame.ui.showStars 0
    swGame.ui.clearAll()
    swGame.ui.hideScore true
    swGame.ui.setProgress 0
  displayLevelNumberAndName = (number = "Secret", name) ->
    pubsub.publish "pause"
    stageIntroLayer.activate "Stage #{swGame.world.getWorldIndex() + 1} - #{(number)}", name
    timer = setTimeout ->
      stageIntroLayer.deactivate()
      pubsub.publish "resume"
    , 2500
  play = ->
    showPlayerInfo true
    hideHome()
  hideHome = ->
    killTimer()
    showScore()
    logoLayer.deactivate()
    highscoreLayer.deactivate()
    swGame.ui.showControls()
    feedbackLogoEl.style.display = "none"
  showHome = ->
    pubsub.publish "resume", true
    showScore()
    playerInfo.deactivate()
    showHomeOverlays()
    swGame.ui.hideControls()
    feedbackLogoEl.style.display = "block"
  showHomeOverlays = ->
    killTimer()
    playBtn.activate()
    logoLayer.activate()
    timer = setTimeout ->
      highscoreLayer.activate()
    , 500
  showPlayerInfo = (isMapMode) ->
    swGame.ui.setScore 0
    playerInfo.setMapMode isMapMode
    playerInfo.activate()
  showScore = -> swGame.ui.showScore true
  killTimer = ->
    if timer
      stageIntroLayer.deactivate()
      clearTimeout(timer)
      timer = null
  clearFullCanvas = -> swGame.globals.ctxFullCanvas.clearRect 0, 0, swGame.globals.fullCanvas.width, swGame.globals.fullCanvas.height

  redrawPlayerInfo = (forceRedraw, opacity) ->
    if playerInfo.opacity isnt opacity or forceRedraw
      playerInfo.opacity = opacity
      playerInfo.redraw()
  init = ->
    bgEl = document.getElementsByTagName("body")[0]
    uiControlEl = document.getElementById("ui-controls")
    feedbackLogoEl= document.getElementById("feedback-logo")

    playBtn = new swGame.PlayButton "center", "center"
    stageIntroLayer = new swGame.StageIntroLayer 0, "center", 0, 160
    playerInfo = new swGame.PlayerInfo 20, 60, 170, 190
    beginKeyLayer = new swGame.BeginKeyLayer 250, 560, 700, 220
    highscoreLayer = new swGame.HighscoreLayer "end", 20, 200, 100
    logoLayer = new swGame.LogoLayer "center", 30, 310, 114
    skipBtn = new swGame.SkipButton "end", 60, 80, 80
    unlockSecretLayer = new swGame.UnlockSecretLayer "25%", "30%"
    secretUnlockedLayer = new swGame.SecretUnlockedLayer "center", "center"

    gameOverLayer = new swGame.GameOverLayer
    lockedGate = new swGame.LockedGate
    pauseBtn = new swGame.PauseButton

    soundBtn = new swGame.SoundButton 0, "end", 66, 74
    soundFxBtn = new swGame.SoundFxButton 70, "end", 66, 74

  pubsub.subscribe "newLevel", newLevel
  pubsub.subscribe "play", play
  pubsub.subscribe "init", init
  pubsub.subscribe "showHome", showHome
  pubsub.subscribe "imagesLoaded", showHomeOverlays
  pubsub.subscribe "displayWorldMap", showScore
  pubsub.subscribe "editorMode", ->
    pubsub.unsubscribe "imagesLoaded", showHomeOverlays
    pubsub.unsubscribe "newLevel", newLevel
    pubsub.unsubscribe "init", init

  showSkipButton: -> skipBtn.activate()
  hideSkipButton: -> skipBtn.deactivate()
  setScore: (score) ->
    playerInfo.score = score
    playerInfo.redraw()
  setProgress: (progress) ->
    playerInfo.progress = progress
    playerInfo.redraw()
  showStars: (stars) ->
    playerInfo.stars = stars
    playerInfo.redraw()
  showScore: (forceRedraw) -> redrawPlayerInfo forceRedraw, 1
  hideScore: (forceRedraw) -> redrawPlayerInfo forceRedraw, 0.2
  showControls: -> uiControlEl.style.display = "block"
  hideControls: -> uiControlEl.style.display = "none"
  clearBoard: (ctx) ->
    (ctx || swGame.globals.ctx).clearRect 0, 0, swGame.globals.width, swGame.globals.height
  clearAll: ->
    swGame.ui.clearBoard swGame.globals.ctx
    swGame.ui.clearBoard swGame.globals.ctxBackground
    swGame.ui.clearFullCanvas
  hideFullCanvas: ->
    clearFullCanvas()
    swGame.globals.fullCanvas.style.display = "none"
  showFullCanvas: ->
    clearFullCanvas()
    swGame.globals.fullCanvas.style.display = "block"
  clearFullCanvas: clearFullCanvas
  setBackgroundColor: (color) ->
    bgEl.style.background = color if bgEl
  showPointsOnBoard: (points, location) -> swGame.PointsLayer.make points, location.getCopy()
  showBonusLevelUnlocked: -> secretUnlockedLayer.activate()
  showSecretGoalIntro: -> unlockSecretLayer.activate()
  activatePlayerInfo: -> playerInfo.activate()
  showLockedGate: (worldName, missingStarCount, x, y) ->
    lockedGate.init(worldName, missingStarCount, x, y)
    lockedGate.activate()
  showPlayerInfo: showPlayerInfo
