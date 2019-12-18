swGame.loader = do ->
  ctx = null
  init = -> ctx = swGame.globals.ctx
  clear = -> ctx.clearRect 0,0,swGame.globals.canvas.width, swGame.globals.canvas.height if ctx
  displayProgressClock = (percent) ->
    endAngle = - Math.PI / 2
    startAngle = 2 * Math.PI * percent / 100 + endAngle
    x = swGame.globals.canvas.width / 2
    y = swGame.globals.canvas.height / 2 - 50
    radgrad = ctx.createRadialGradient x, y, 50, x, y, 100
    radgrad.addColorStop 0, '#f3ec19'
    radgrad.addColorStop 1, '#ed1f24'
    ctx.fillStyle = radgrad
    ctx.beginPath()
    ctx.moveTo x, y
    ctx.arc x, y, 100, startAngle, endAngle,true
    ctx.fill()
  displayProgressPercent = (percent) ->
    text = "#{percent}%"
    ctx.font = "bold 60px Comic Sans MS"
    ctx.fillStyle = "#62c4b0"
    x = (swGame.globals.canvas.width - ctx.measureText(text).width) / 2
    y = swGame.globals.canvas.height / 2 - 30
    ctx.fillText text, x, y 
    ctx.strokeStyle = "#000"
    ctx.strokeText text, x, y
  repaint = (percent) ->
    clear()
    if ctx
      ctx.save()
      displayProgressClock percent
      displayProgressPercent percent
      ctx.restore()
  pubsub.subscribe "init", init
  pubsub.subscribe "imagesLoadedProgress", repaint

