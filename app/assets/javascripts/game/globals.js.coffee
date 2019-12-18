swGame.globals = do ->
  "use strict"

  initContextFont = (ctx) ->
    ctx.font = "20px akaDylan"
    ctx.fillStyle = "#f7f124"

  resizeCanvas = (canvas) ->
    canvas.height = swGame.globals.height
    canvas.width = swGame.globals.width
    if canvas.style.width
      canvas.style.height = (canvas.style.width * swGame.globals.height / swGame.globals.width) + "px"
    else
      canvas.style.width = (swGame.globals.width / swGame.settings.pixelRatio) + "px"
      canvas.style.height = (swGame.globals.height / swGame.settings.pixelRatio) + "px"

  initFullCanvas = ->
    swGame.globals.fullCanvas.height = swGame.settings.pixelRatio * window.innerHeight
    swGame.globals.fullCanvas.width = swGame.settings.pixelRatio * window.innerWidth
    swGame.globals.fullCanvas.style.height = window.innerHeight + "px"
    swGame.globals.fullCanvas.style.width = window.innerWidth + "px"
    swGame.globals.fullCanvas.style.display = "none"

  resizeAllCanvas = ->
    resizeCanvas swGame.globals.canvas
    resizeCanvas swGame.globals.canvasBackground
    resizeCanvas swGame.globals.uiCanvas
    initFullCanvas()
    overlayEl = document.getElementById "overlay"
    if overlayEl
      overlayEl.style.width = swGame.gameData.width + "px"
      overlayEl.style.height = (swGame.gameData.height - 20) + "px"

  initCanvasDimensions = ->
    if swGame.gameData
      width = swGame.gameData.width
      height = swGame.gameData.height
    else
      width = Math.min 640, window.innerWidth
      height = Math.min 320, window.innerHeight
    swGame.globals.width = width * swGame.settings.pixelRatio
    swGame.globals.height = height * swGame.settings.pixelRatio
    resizeAllCanvas()
    centerCanvas height

  centerCanvas = (height) ->
    document.getElementById("main").style.marginTop = (Math.round((window.innerHeight - height) / 2)) + "px"


  pubsub.subscribe "newLevel", (cp) ->
    swGame.globals.drawingPath.destroy() if swGame.globals.drawingPath
    swGame.globals.path.destroy() if swGame.globals.path
    swGame.globals.path = cp.level.startPath.getCopy()
    
  # canvases set on onLoad in gameManager
  ctx: null               
  canvas: null
  canvasBackground: null
  ctxBackground: null
  fullCanvas: null
  ctxFullCanvas: null
  uiCanvas: null
  ctxUi: null
  path: null              # main path
  drawingPath: null       # player's drawing path
  player: null            # player's position
  width: null
  height: null
  frameEl: null
  isOnPill: false
  playerSpeed: null
  CHECKPOINT_LEVEL: 0
  CHECKPOINT_WORLD_GATE: 1
  CHECKPOINT_BONUS_LEVEL: 2
  CHECKPOINT_GAME_START_POS: 3
  CHECKPOINT_WORLD_BEGIN: 4
  CHECKPOINT_WORLD_END: 5


  init: ->
    swGame.globals.frameEl = document.getElementById "game-content"
    swGame.globals.canvas = document.getElementById "canvas"
    swGame.globals.ctx = swGame.globals.canvas.getContext "2d"
    swGame.globals.canvasBackground = document.getElementById "canvas-bg"
    swGame.globals.ctxBackground = swGame.globals.canvasBackground.getContext "2d"
    swGame.globals.fullCanvas = document.getElementById "full-canvas"
    swGame.globals.ctxFullCanvas = swGame.globals.fullCanvas.getContext "2d"
    swGame.globals.uiCanvas = document.getElementById "canvas-ui"
    swGame.globals.ctxUi = swGame.globals.uiCanvas.getContext "2d"
    swGame.globals.drawingPath = new swGame.DrawingPath
    initContextFont swGame.globals.ctx
    initContextFont swGame.globals.ctxBackground
    initContextFont swGame.globals.ctxFullCanvas
    initContextFont swGame.globals.ctxUi
    initCanvasDimensions()
    window.addEventListener "resize", initFullCanvas



