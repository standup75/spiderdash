swGame.controls = do ->
  "use strict"
  mainEl = null
  canvas = null
  tapTime = null
  keyboardRequested = false
  keyIsPressed = false
  doubleTapMs = 200
  touch = swGame.device.touch
  xRatio = null
  yRatio = null
  requestKeyboard = -> keyboardRequested = true
  releaseKeyboard = -> keyboardRequested = false
  crouch = -> pubsub.publish "crouch"
  canvasOffsetLeft = ->
    if swGame.globals.frameEl
      swGame.globals.frameEl.offsetLeft + mainEl.offsetLeft + canvas.offsetLeft
    else
      canvas.offsetLeft
  canvasOffsetTop = ->
    if swGame.globals.frameEl
      mainEl.offsetTop + canvas.offsetTop
    else
      canvas.offsetTop
  isDoubleTap = ->
    newTapTime = new Date().getTime()
    doubleTap = tapTime && (newTapTime - tapTime < doubleTapMs)
    tapTime = newTapTime
    doubleTap
  onTap = (e) ->
    stopEvent(e)
    touch = e.changedTouches[0]
    [x, y] = getCoords touch.pageX, touch.pageY
    pubsub.publish("touch", x, y, isDoubleTap()) unless keyboardRequested
  onClick = (e) ->
    e.stopPropagation()
    [x, y] = getCoords e.clientX, e.clientY
    pubsub.publish("touch", x, y, isDoubleTap()) unless keyboardRequested
  getCoords = (x, y) -> [xRatio * (x - canvasOffsetLeft()), yRatio * (y - canvasOffsetTop()+window.pageYOffset)]
  stopEvent = (e) ->
    e.preventDefault()
    e.stopPropagation()
  togglePause = (e) -> 
    stopEvent(e)
    pubsub.publish "togglePause"
  keyUp = ->
    keyIsPressed = false
    pubsub.publish "keyup"
  keyPressed = (e) ->
    if keyIsPressed is e.which
      stopEvent e
      return 
    keyIsPressed = e.which
    if keyboardRequested
      pubsub.publish("esc") if e.keyCode == 27
      return
    arrowKeyPressed = (x, y) ->
      stopEvent e
      pubsub.publish "turn", x, y
    switch e.keyCode
      when 38 then arrowKeyPressed 0, -1
      when 40 then arrowKeyPressed 0, 1
      when 39 then arrowKeyPressed 1, 0
      when 37 then arrowKeyPressed -1, 0
      when 27, 80
        stopEvent e
        pubsub.publish "togglePause"
      when 32, 13
        stopEvent e
        pubsub.publish "select"
      when 9
        stopEvent e
        pubsub.publish "tab"
      # t
      when 84
        swGame.ui.clearBoard()
        pubsub.publish "repaint"
  init = ->
    mainEl = document.getElementById("main")
    document.getElementsByTagName('html')[0].className += ' touch' if touch
    canvas = swGame.globals.canvas
    xRatio = swGame.globals.width / parseInt(canvas.style.width, 10)
    yRatio = swGame.globals.height / parseInt(canvas.style.height, 10)
    if touch
      mainEl.addEventListener "touchstart", onTap
      document.addEventListener "touchstart", crouch
    else
      mainEl.addEventListener "mousedown", onClick
      document.addEventListener "mousedown", crouch
    window.addEventListener "keydown", keyPressed, false
    window.addEventListener "keyup", keyUp, false

  pubsub.subscribe "init", init
  pubsub.subscribe "requestKeyboard", requestKeyboard
  pubsub.subscribe "releaseKeyboard", releaseKeyboard
