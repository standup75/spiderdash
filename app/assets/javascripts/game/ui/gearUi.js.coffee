swGame.gearUi = do ->
  height = 80
  width = 260
  marginTop = 220
  marginLeft = 30
  opacity = 0.8
  timerSlots = {}
  currentIndex = 0
  image = null

  getContext = -> swGame.globals.ctxUi
  getOffsetTop = (name) -> timerSlots[name].index * height + marginTop
  clear = (name) ->
    getContext().clearRect marginLeft, getOffsetTop(name), width, height
  init = (img, imgHeight, imgWidth, count, type, name) ->
    image = img
    unless timerSlots[name]
      timerSlots[name] = 
        index: currentIndex++
        img: img
        imgHeight: imgHeight
        imgWidth: imgWidth
    timerSlots[name][type] = count
  redraw = (name) ->
    slot = timerSlots[name]
    y = getOffsetTop name
    ctx = getContext()
    ctx.save()
    ctx.globalAlpha = opacity
    ctx.drawImage slot.img, 0, 0, slot.imgWidth, slot.imgHeight, marginLeft, y, slot.imgWidth, slot.imgHeight
    swGame.helpers.setFontStyleSmall ctx, 32, "#FFFEA7"
    counter = if slot.count? then slot.count else "#{slot.sec}s"
    swGame.helpers.drawText ctx, counter, 10 + marginLeft + slot.imgWidth, y + 44
    ctx.restore()

  drawSec: (img, imgHeight, imgWidth, sec, name) ->
    init img, imgHeight, imgWidth, sec, "sec", name
    clear name
    redraw name
  drawCount: (img, imgHeight, imgWidth, count, name) ->
    init img, imgHeight, imgWidth, count, "count", name
    clear name
    redraw name
  remove: (name) ->
    return unless timerSlots[name]
    clear name
    index = timerSlots[name].index
    delete timerSlots[name]
    currentIndex--
    for key of timerSlots when timerSlots[key].index > index
      clear key
      timerSlots[key].index--
      redraw key
