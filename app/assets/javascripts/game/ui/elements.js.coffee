class swGame.PlayButton extends swGame.clickable
  image: swGame.images.add "#{swGame.settings.assetsPath}/ui/play.png"
  clicked: ->
    @deactivate()
    pubsub.publish "play"

class swGame.LogoLayer extends swGame.displayable
  image: swGame.images.add "#{swGame.settings.assetsPath}/ui/title.png"
  #image: swGame.images.add "#{swGame.settings.assetsPath}/ui/title_beta.png"

class swGame.UnlockSecretLayer extends swGame.displayable
  image: swGame.images.add "#{swGame.settings.assetsPath}/ui/unlock_secret.png"
  activate: ->
    super
    setTimeout =>
      @deactivate()
    , 2000

class swGame.SecretUnlockedLayer extends swGame.displayable
  image: swGame.images.add "#{swGame.settings.assetsPath}/ui/secret_unlocked.png"
  activate: ->
    super
    setTimeout =>
      @deactivate()
    , 3000

class swGame.StageIntroLayer extends swGame.displayable
  activate: (text, name) ->
    @text = text
    @name = name
    super
  draw: ->
    @ctx.save()
    swGame.helpers.setFontStyleSmall @ctx, 40, "#aaa"
    # display Stage XX - XX
    textSize = @ctx.measureText @text
    textX = (@ctx.canvas.width - textSize.width) / 2
    swGame.helpers.drawText @ctx, @text, textX, @y + 40
    swGame.helpers.setFontStyle @ctx, 60
    # display stage name
    nameSize = @ctx.measureText @name
    nameX = (@ctx.canvas.width - nameSize.width) / 2
    swGame.helpers.drawText @ctx, @name, nameX, @y + 140
    @ctx.restore()
    # set variables with adjustments:
    # the font is a little bigger than its own placeholder...
    @width = Math.max(textSize.width, nameSize.width) + 20
    @x = Math.min(textX, nameX) - 10

class swGame.BeginKeyLayer extends swGame.displayable
  arrowKeyImage: swGame.images.add "#{swGame.settings.assetsPath}/ui/right_arrow_key.png"
  enterKeyImage: swGame.images.add "#{swGame.settings.assetsPath}/ui/enter_key.png"
  isArrow: true
  draw: ->
    return if swGame.device.touch
    x = @x + 60
    y = @y + 140
    @ctx.save()
    swGame.helpers.setFontStyleSmall @ctx, 60, "#f7f124"
    image = if @isArrow then @arrowKeyImage else @enterKeyImage
    text = "Press"
    textSize = @ctx.measureText text
    @ctx.fillStyle = "#f7f124"
    @ctx.strokeStyle = "rgba(0,0,0,1)"
    @ctx.lineWidth = 4
    @ctx.fillText text, x, y
    @ctx.strokeText text, x, y
    @ctx.drawImage image, @x + 340, @y + 60
    @ctx.restore()
  cancel: => @deactivate()
  turn: (x, y) =>
    if x is 1
      @isArrow = false
      @pointer.angle = 0
      @pointer.x += 40
      @pointer.y += 10
      pubsub.unsubscribe "turn", @turn
      pubsub.subscribe "select", @cancel
      @redraw()
  activate: =>
    @pointer = swGame.Pointer.make
      x: @x
      y: @y
      angle: if swGame.device.touch then 0 else (7 * Math.PI) / 4
    if localStorage.gameProgress
      pubsub.unsubscribe("play_done", @activate)
      @deactivate()
    else
      super
      pubsub.subscribe "newLevel", @cancel
      pubsub.subscribe "turn", @turn
  deactivate: ->
    super
    @pointer = @pointer.unmake()
    pubsub.unsubscribe "newLevel", @cancel
    pubsub.unsubscribe "turn", @turn
    pubsub.unsubscribe "select", @cancel
  constructor: ->
    super
    pubsub.subscribe("play_done", @activate) unless localStorage.gameProgress

class swGame.PointsLayer extends swGame.Module
  "use strict"
  ctx = null
  STEPS = 20 # number of steps for the animation
  FONT_SIZE = 60
  DURATION = 80 # number of repaint the animation will last
  STEP_LENGTH = Math.round DURATION / STEPS
  @extend swGame.PoolFactory
  counter: 0 
  points: 0
  location: null
  init: (points, location) ->
    ctx = ctx || swGame.globals.ctx
    @location = location
    @counter = 0
    @points = points
    pubsub.subscribe "repaint", @repaint
  repaint: =>
    swGame.helpers.setFontStyle ctx, FONT_SIZE
    width = ctx.measureText(@points).width
    x = @location.x- Math.round width/2
    currentStep = @counter / STEP_LENGTH
    y = Math.round @location.y + FONT_SIZE / 2 - currentStep
    ctx.save()
    ctx.globalAlpha = 2 * (1 - currentStep / STEPS)
    swGame.helpers.drawText ctx, @points, x, y
    ctx.restore()
    @unmake() if ++@counter == DURATION
  destroy: =>
    @location.unmake()
    pubsub.unsubscribe "repaint", @repaint


class swGame.PlayerInfo extends swGame.displayable
  opacity: 1
  score: 0
  progress: 0
  stars: 0
  isWorldMap: false
  gaugeImage: swGame.images.add "#{swGame.settings.assetsPath}/ui/gauge.png"
  starImage: swGame.images.add "#{swGame.settings.assetsPath}/ui/star.png"
  draw: ->
    @ctx.save()
    @ctx.globalAlpha = @opacity
    if @isWorldMap
      @_drawTotalStars()
    else
      @_drawProgress()
      @_drawLevelStars()
    swGame.helpers.setFontStyleSmall @ctx, 32, "#FFFEA7"
    swGame.helpers.drawText @ctx, " #{swGame.profile.getScore()}", @x, @y + 32
    @ctx.restore()

  _drawTotalStars: ->
    totalStars = swGame.profile.getWorldStarCount swGame.world.getWorldIndex()
    if totalStars
      @ctx.drawImage @starImage, 0, 0, 30, 30, @x + 10, @y + 70, 30, 30
      swGame.helpers.setFontStyleSmall @ctx, 28, "#FFFEA7"
      swGame.helpers.drawText @ctx, "x#{totalStars}", @x + 56, @y + 96

  _drawProgress: ->
    hue = Math.round 200 * (1 - @progress / 100)
    @ctx.fillStyle = "hsla(#{hue}, 100%, 70%, 1)"
    @ctx.fillRect @x + 2, @y + 82, @progress * 1.5, 14
    @ctx.drawImage @gaugeImage, @x, @y + 80

  _drawLevelStars: ->
    for i in [0..2]
      offset = if i < @stars then 0 else 30
      @ctx.drawImage @starImage, offset, 0, 30, 30, @x + i * 60, @y + 110, 30, 30

  setMapMode: (isWorldMap) -> @isWorldMap = isWorldMap

class swGame.LockedGate extends swGame.displayable
  worldName: null
  starCount: 0
  starImage: swGame.images.add "#{swGame.settings.assetsPath}/ui/star.png"
  width: 680
  height: 260
  margin: 40
  padding: 40
  arrowSize: 40
  arrowIsOnTheLeft: true
  cancel: =>
    if @timer
      @deactivate()
      clearTimeout(@timer)
      @timer = null
      true
    else
      false
  activate: ->
    return if @cancel()
    pubsub.subscribe "newLevel", @cancel
    pubsub.subscribe "turn", @cancel
    pubsub.subscribe "select", @cancel
    super
    @timer = setTimeout =>
      @deactivate()
      @timer = null
    , 3000
  deactivate: ->
    super
    pubsub.unsubscribe "newLevel", @cancel
    pubsub.unsubscribe "turn", @cancel
    pubsub.unsubscribe "select", @cancel
  init: (worldName, starCount, x, y) ->
    @cancel()
    @starCount = starCount
    @worldName = worldName
    @y = y - @height / 2
    if x - @width > 0
      @arrowIsOnTheLeft = false
      @x = x - @width
    else
      @arrowIsOnTheLeft = true
      @x = x
  draw: ->
    @ctx.save
    @ctx.globalAlpha = 0.5
    @ctx.fillStyle = "#000"
    @ctx.fillRect @x + @arrowSize + @margin, @y, @rectWidth, @height
    @ctx.beginPath()
    if @arrowIsOnTheLeft
      @ctx.moveTo @x + @arrowSize + @margin, @y - @arrowSize + @height / 2
      @ctx.lineTo @x + @margin, @y + @height / 2
      @ctx.lineTo @x + @arrowSize + @margin, @y + @arrowSize + @height / 2
      @ctx.lineTo @x + @arrowSize + @margin - 10, @y + @height - 10
      @ctx.lineTo @x + @width / 3, @y + @height - 34
      @ctx.lineTo @x + @width - @arrowSize - @margin, @y + @height - 10
      @ctx.lineTo @x + @width - @arrowSize - @margin - 20, @y + @height / 2
      @ctx.lineTo @x + @width - @arrowSize - @margin, @y + 10
      @ctx.lineTo @x + @width * 3 / 5, @y + 34
      @ctx.lineTo @x + @arrowSize + @margin - 10, @y + 10
      @ctx.lineTo @x + @arrowSize + @margin, @y - @arrowSize + @height / 2
    else
      @ctx.moveTo @x + @width - @arrowSize - @margin - 2, @y + @arrowSize + @height / 2
      @ctx.lineTo @x + @width - @margin, @y + @height / 2
      @ctx.lineTo @x + @width - @arrowSize - @margin - 2, @y - @arrowSize + @height / 2
      @ctx.lineTo @x + @width - @arrowSize - @margin, @y + 10
      @ctx.lineTo @x + @width * 3 / 5, @y + 34
      @ctx.lineTo @x + @arrowSize + @margin - 10, @y + 10
      @ctx.lineTo @x + @arrowSize + @margin + 20, @y - @arrowSize + @height / 2
      @ctx.lineTo @x + @arrowSize + @margin - 10, @y + @height - 10
      @ctx.lineTo @x + @width / 3, @y + @height - 34
      @ctx.lineTo @x + @width - @arrowSize - @margin, @y + @height - 10
      @ctx.lineTo @x + @width - @arrowSize - @margin - 2, @y + @arrowSize + @height / 2
    @ctx.fill()
    @ctx.lineWidth = 6
    @ctx.strokeStyle = "#f7f124"
    @ctx.stroke()
    @ctx.globalAlpha = 1
    @ctx.lineWidth = 2
    x = @x + @arrowSize + @margin + @padding
    y = @y + @padding + 50
    swGame.helpers.setFontStyle @ctx, 36
    swGame.helpers.drawText @ctx, @worldName, x, y
    swGame.helpers.setFontStyleSmall @ctx, 28, "#ddd"
    swGame.helpers.drawText @ctx, "You still need #{@starCount}", x, y + 60
    starX = if @starCount > 9 then x + 330 else x + 310
    @ctx.drawImage @starImage, 0, 0, @starImage.width / 2, @starImage.height, starX, y + 34, @starImage.width / 2, @starImage.height
    swGame.helpers.drawText @ctx, "to access this world", x, y + 100
    @ctx.restore()


class swGame.HighscoreLayer extends swGame.displayable
  wreath: swGame.images.add "#{swGame.settings.assetsPath}/ui/wreath.png"
  draw: ->
    highscore = swGame.profile.getGameProgress()?.score
    if highscore
      @ctx.font = "40px akaDylan"
      @ctx.fillStyle = "#f7f124"
      textSize = @ctx.measureText highscore
      @x = @ctx.canvas.width - textSize.width - 34
      @width = textSize.width + 20
      @ctx.drawImage @wreath, @x + Math.round((textSize.width - @wreath.width) / 2), @y
      swGame.helpers.drawText @ctx, highscore, @ctx.canvas.width - textSize.width - 34, @y + 60

class swGame.SoundControl extends swGame.clickable
  offImage: swGame.images.add "#{swGame.settings.assetsPath}/ui/sound_off.png"
  on: true

  draw: (image = @image) ->
    @ctx.drawImage image, 0, 0, @width, @height, @x, @y, @width, @height
    unless @on
      @ctx.drawImage @offImage, 0, 0, @width, @height, @x, @y, @width, @height

  activateHome: =>
    @isAtHome = true
    @activate()
  deactivateHome: =>
    @isAtHome = false
    @deactivate()
  switchMusic: (soundIsOn) =>
      @on = soundIsOn
      @redraw()
  constructor: ->
    super
    @x += 20
    @y -= 20
    pubsub.subscribe "showSoundControls", (=> @activate() unless @isAtHome)
    pubsub.subscribe "hideSoundControls", (=> @deactivate() unless @isAtHome)
    pubsub.subscribe "showHome", @activateHome
    pubsub.subscribe "init_done", @activateHome
    pubsub.subscribe "play", @deactivateHome

class swGame.SoundButton extends swGame.SoundControl
  buttonSelected: swGame.images.add "#{swGame.settings.assetsPath}/ui/music_selected.png"
  image: swGame.images.add "#{swGame.settings.assetsPath}/ui/music.png"

  clicked: -> swGame.profile.setSound(not @on)
  constructor: ->
    super
    pubsub.subscribe "switchMusic", @switchMusic

class swGame.SoundFxButton extends swGame.SoundControl
  buttonSelected: swGame.images.add "#{swGame.settings.assetsPath}/ui/sound_fx_selected.png"
  image: swGame.images.add "#{swGame.settings.assetsPath}/ui/sound_fx.png"

  clicked: -> swGame.profile.setSoundFx(not @on)
  constructor: ->
    super
    pubsub.subscribe "switchSoundFx", @switchMusic
  
class swGame.SkipButton extends swGame.clickable
  image: swGame.images.add "#{swGame.settings.assetsPath}/ui/play.png"
  clicked: -> pubsub.publish "select"
  draw: (image = @image) ->
    @ctx.save()
    @ctx.translate @x, @y
    @ctx.scale 0.5, 0.5
    @ctx.drawImage image, 0, 0
    @ctx.restore()


class swGame.GameOverLayer
  text: "Try Again!"
  cycleCount: 100
  cycle: null
  height: 140
  y: 200
  x: null
  width: null
  percentClosed: 0
  messages: [
    "Less than 10% complete. Come on!"
    "_percent_% complete. Can do better"
    "_percent_% complete. Not bad"
    "_percent_% complete. Pretty good"
    "_percent_% complete. Almost there"
    "_percent_% complete. You'll make it next time!"
    "What? You were done..."
  ]
  _getMessage: (percent) -> @messages[Math.floor(percent/10)].replace "_percent_", percent
  _setStyle: (size, color = "#666666") ->
    @ctx.font = "#{size}px akaDylan"
    @ctx.fillStyle = color
  _drawMessage: ->
    @_setStyle 60, "#f7f124"
    msg = @_getMessage @percentClosed
    textSize = @ctx.measureText msg
    y = @y + 600
    x = Math.round((@ctx.canvas.width - textSize.width) / 2)
    @ctx.lineWidth = 1
    @ctx.strokeStyle = "#000"
    @ctx.fillText msg, x, y
    @ctx.strokeText msg, x, y
  _fillRect: ->
    @ctx.fillStyle = "rgba(255, 255, 255, #{1 - @cycle / @cycleCount})"
    @ctx.clearRect 0, 0, @ctx.canvas.width, @ctx.canvas.height
    @ctx.fillRect 0, 0, @ctx.canvas.width, @ctx.canvas.height
  _drawTryAgain: ->
    @_setStyle 100
    y = @y + @cycle * 2
    @ctx.fillText @text, @x, y
    @ctx.lineWidth = 6
    @ctx.strokeStyle = "rgba(255,255,255,0.5)"
    @ctx.strokeText @text, @x, y
  clear: ->
    @ctx.clearRect @x - @width / 2 - 80, @y - @height, @width + 160, @height
  draw: =>
    @ctx.save()
    @_fillRect()
    @_drawTryAgain()
    @_drawMessage()
    @ctx.restore()
    @done() if @cycle++ is @cycleCount
  done: ->
    @ctx.clearRect 0, 0, @ctx.canvas.width, @ctx.canvas.height
    pubsub.publish "move"
    pubsub.unsubscribe "repaint", @draw
    swGame.ui.showStars 0
    swGame.ui.setProgress 0
  activate: =>
    @percentClosed = swGame.profile.getPercentClosed()
    pubsub.publish "resume", true
    pubsub.publish "retry"
    pubsub.publish "freeze"
    pubsub.subscribe "repaint", @draw
    @cycle = 0
  constructor: ->
    @ctx = swGame.globals.ctxUi
    @_setStyle 100
    textSize = @ctx.measureText @text
    @width = textSize.width
    @x = Math.round((@ctx.canvas.width - @width) / 2)
    pubsub.subscribe "gameOver", @activate

class swGame.PauseButton
  soundBtn: null
  soundFxBtn: null
  isManual: false
  pauseBtnEl: null
  exitBtnEl: null
  turnOn: (isManual) =>
    @isManual = isManual
    if isManual
      pubsub.publish "showSoundControls"
      @exitBtnEl.style.display = "block"
      @pauseBtnEl.className = "css_sprite-play"
  turnOff: (isManual) =>
    if isManual or not @isManual
      pubsub.publish "hideSoundControls"
      @exitBtnEl.style.display = "none"
      @pauseBtnEl.className = "css_sprite-pause"
  initPauseButton: ->
    @pauseBtnEl = document.getElementById "pause-btn"
    if swGame.device.touch
      @pauseBtnEl.addEventListener "touchstart", -> pubsub.publish "togglePause"
    else
      @pauseBtnEl.addEventListener "mousedown", -> pubsub.publish "togglePause"
    pubsub.subscribe "resume", @turnOff
    pubsub.subscribe "pause", @turnOn
  initExitButton: ->
    @exitBtnEl = document.getElementById "exit-btn"
    exit = ->
      pubsub.publish "resume", true
      pubsub.publish "showHome"
    if swGame.device.touch
      @exitBtnEl.addEventListener "touchstart", exit
    else
      @exitBtnEl.addEventListener "mousedown", exit
  constructor: ->
    @initPauseButton()
    @initExitButton()
    @x -= 20
