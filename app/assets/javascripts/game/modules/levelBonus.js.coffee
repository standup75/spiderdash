swGame.levelBonus = do ->
  startTime = pauseTime = 0
  # bubble settings
  maxStartSize = 0.1
  maxBubbleCount = 50
  frequency = 2
  bubbleLauncher = null

  init = ->
    swGame.ui.showFullCanvas()
    # level bonus settings
    swGame.levelBonus.bonusCount = 1
    swGame.levelBonus.marginTop = swGame.globals.fullCanvas.height / 2 - (100 * swGame.settings.pixelRatio)
    swGame.levelBonus.bonusHeight = 100
    swGame.levelBonus.timeLimit = 60 # seconds to finish a level and have a time bonus
    swGame.levelBonus.ptBySec = 20
    swGame.levelBonus.ptByStar = 300
    swGame.levelBonus.ptByPercent = 50
    swGame.levelBonus.ptByKill = 100
    # events
    pubsub.unsubscribe "pause", pause
    pubsub.unsubscribe "resume", resume
    pubsub.publish "freeze"
    pubsub.subscribe "displayWorldMap", deactivate
    # bubbles
    bubbleLauncher = new swGame.FullscreenBubbles maxBubbleCount, frequency, maxStartSize

  initStartTime = (cp, isDemo) ->
    if not isDemo
      startTime = +(new Date)
      pubsub.subscribe "pause", pause
      pubsub.subscribe "resume", resume
      pubsub.subscribe "freeze", pause
      pubsub.subscribe "move", resume

  pause = ->
    pauseTime = new Date().getTime()
    
  resume = ->
    if pauseTime
      timeDiff = new Date().getTime() - pauseTime
      pauseTime = 0
      startTime += timeDiff

  showContinue = ->
    pubsub.subscribe "touch", goToWorldMap
    pubsub.subscribe "select", goToWorldMap

  goToWorldMap = ->
    pubsub.unsubscribe "touch", goToWorldMap
    pubsub.unsubscribe "select", goToWorldMap
    pubsub.publish "resume", true
    swGame.ui.hideFullCanvas()
    bubbleLauncher.deactivate()
    bubbleLauncher = null
    pubsub.publish "displayWorldMap"

  showLevelHeader = -> showHeader "Stage completed!"
  showSecretHeader = -> showHeader "Secret stage bonus:"
  showHeader = (text) ->
    ctx = swGame.globals.ctxFullCanvas
    ctx.save()
    swGame.helpers.setFontStyle ctx, 40
    textSize = ctx.measureText text
    swGame.helpers.drawText ctx, text, (swGame.globals.fullCanvas.width - textSize.width) / 2, swGame.levelBonus.marginTop
    ctx.restore()

  deactivate = ->
    pubsub.unsubscribe "displayWorldMap", deactivate
    pubsub.unsubscribe "repaint_done", showLevelHeader
    pubsub.unsubscribe "repaint_done", showSecretHeader

  pubsub.subscribe "newLevel", initStartTime

  show: (stars, percent) ->
    init()
    bubbleLauncher.createFrameBubble()
    swGame.ui.showScore()
    pubsub.subscribe "repaint_done", showLevelHeader
    new swGame.levelBonus.timeBonus startTime, ->
      new swGame.levelBonus.starBonus stars, ->
        new swGame.levelBonus.percentBonus percent, ->
          new swGame.levelBonus.killBonus null,  ->
            new swGame.levelBonus.showContinue null, ->
              showContinue()
  showSecret: (points) ->
    init()
    bubbleLauncher.createFrameBubble()
    swGame.ui.activatePlayerInfo()
    pubsub.subscribe "repaint_done", showSecretHeader
    new swGame.levelBonus.secretBonus points, -> showContinue()

class swGame.levelBonus.base
  bonusY: 0
  bonusX: 0
  bonusPtX: 0
  points: 0
  ctx: null
  done: null
  finished: false

  # abstract methods (a ma facon...)
  condition: -> false
  drawBonus: ->
  move: ->
  completedCondition: -> true

  repaint: =>
    @drawBonus()
    if @completedCondition()
      if not @finished
        @finished = true
        swGame.profile.updateScore @points
        @done()
    else
      @move()

  deactivate: =>
    pubsub.unsubscribe "displayWorldMap", @deactivate
    pubsub.unsubscribe "repaint_done", @repaint

  constructor: (options, callback) ->
    @done = callback
    @ctx = swGame.globals.ctxFullCanvas
    if @condition()
      setTimeout =>
        @bonusY = swGame.levelBonus.marginTop + swGame.levelBonus.bonusHeight * swGame.levelBonus.bonusCount
        @bonusX = swGame.globals.fullCanvas.width / 2 - (100 * swGame.settings.pixelRatio)
        @bonusPtX = swGame.globals.fullCanvas.width / 2 + (40 * swGame.settings.pixelRatio)
        pubsub.subscribe "displayWorldMap", @deactivate
        pubsub.subscribe "repaint_done", @repaint
        swGame.levelBonus.bonusCount++
      , 300
    else
      @done()

class swGame.levelBonus.secretBonus extends swGame.levelBonus.base
  points: 0
  condition: -> true
  drawBonus: ->
    @ctx.save()
    swGame.helpers.setFontStyle @ctx, 100
    x = (swGame.globals.fullCanvas.width - @ctx.measureText(@points).width) / 2
    swGame.helpers.drawText @ctx, @points, x, @bonusY + 100
    @ctx.restore()
  constructor: (_points, callback) ->
    @points = _points
    super

class swGame.levelBonus.timeBonus extends swGame.levelBonus.base
  timeElapsed: 0
  timeCursor: 0
  clockImage: swGame.images.add "#{swGame.settings.assetsPath}/bonus/clock.png"

  condition: -> @timeElapsed < swGame.levelBonus.timeLimit
  drawBonus: ->
    @ctx.save()
    swGame.helpers.setFontStyleSmall @ctx, 30
    swGame.helpers.drawText @ctx, @timeCursor + "s", @bonusX + 110, @bonusY - 6
    swGame.helpers.setFontStyle @ctx, 40
    swGame.helpers.drawText @ctx, @points, @bonusPtX, @bonusY
    @ctx.restore()
    @_displayClock()
  move: ->
    @timeCursor--
    @points += swGame.levelBonus.ptBySec
  completedCondition: -> @timeCursor < 0 or @timeCursor <= @timeElapsed
  _displayClock: ->
    endAngle = -Math.PI / 2
    timeElapsedAngle = 2 * Math.PI * @timeElapsed / swGame.levelBonus.timeLimit + endAngle
    timeBonusAngle = 2 * Math.PI * @timeCursor / swGame.levelBonus.timeLimit + endAngle
    y = @bonusY - 20
    @ctx.fillStyle = "#999"
    @ctx.beginPath()
    @ctx.moveTo @bonusX + 30, y
    @ctx.arc @bonusX + 30, y, 26, timeElapsedAngle, endAngle, true
    @ctx.fill()
    hue = Math.round 200 * (1 - @timeCursor/swGame.levelBonus.timeLimit)
    @ctx.fillStyle = "hsl(#{hue}, 100%, 40%)"
    @ctx.beginPath()
    @ctx.moveTo @bonusX + 30, y
    @ctx.arc @bonusX + 30, y, 24, timeBonusAngle, timeElapsedAngle, true
    @ctx.fill()
    @ctx.drawImage @clockImage, @bonusX, y - 30

  constructor: (startTime, callback) ->
    @timeCursor = swGame.levelBonus.timeLimit
    endTime = +(new Date)
    @timeElapsed = (Math.floor (endTime - startTime) / 1000)
    super

class swGame.levelBonus.starBonus extends swGame.levelBonus.base
  starImage: swGame.images.add "#{swGame.settings.assetsPath}/bonus/big-star.png"
  stars: 0
  starsAdded: 0
  wait: 10
  waitLimit: 10

  condition: -> @stars > 0

  drawBonus: ->
    if @starsAdded
      @ctx.save()
      swGame.helpers.setFontStyle @ctx, 40
      swGame.helpers.drawText @ctx,  @points, @bonusPtX, @bonusY - 6
      @ctx.restore()
      for i in [1..@starsAdded]
        @ctx.drawImage @starImage, @bonusX - 90 + 80 * i, @bonusY - 66

  move: ->
    if @wait++ == @waitLimit
      @wait = 0
      @starsAdded++
      @points += swGame.levelBonus.ptByStar
  completedCondition: -> @stars == @starsAdded

  constructor: (stars, callback) ->
    @stars = stars
    super

class swGame.levelBonus.percentBonus extends swGame.levelBonus.base
  percent: 0
  points: 0
  percentDiff: 0
  gaugeImage: swGame.images.add "#{swGame.settings.assetsPath}/ui/gauge.png"

  condition: -> @percentDiff > 0
  drawBonus: ->
    threshold = swGame.settings.percentFinish / 2
    @ctx.save()
    @ctx.fillStyle = "#dec93d"
    @ctx.fillRect @bonusX + 2, @bonusY - 24, threshold, 14
    @ctx.fillStyle = "#2dc918"
    @ctx.fillRect @bonusX + 2 + threshold, @bonusY - 24, @percent / 2, 14
    @ctx.drawImage @gaugeImage, @bonusX, @bonusY - 26, 104, 18
    swGame.helpers.setFontStyleSmall @ctx, 30
    swGame.helpers.drawText @ctx, swGame.settings.percentFinish + @percent + "%", @bonusX + 140, @bonusY - 6
    swGame.helpers.setFontStyle @ctx, 40
    swGame.helpers.drawText @ctx, @points, @bonusPtX, @bonusY
    @ctx.restore()
  move: ->
    @points += swGame.levelBonus.ptByPercent
    @percent++
  completedCondition: -> @percent == @percentDiff

  constructor: (percent, callback) ->
    @percentDiff = Math.ceil percent - swGame.settings.percentFinish 
    super

class swGame.levelBonus.killBonus extends swGame.levelBonus.base
  killCount: 0
  wait: 2
  waitLimit: 3
  points: 0

  condition: -> swGame.level.getEnemyCount() == swGame.level.getKillCount()
  drawBonus: ->
    @ctx.save()
    swGame.helpers.setFontStyle @ctx, 40
    swGame.helpers.drawText @ctx, @points, @bonusPtX, @bonusY - 6
    @ctx.fillStyle = "#FBB"
    swGame.helpers.drawText @ctx, "MASSACRE", @bonusX - 80, @bonusY - 6
    @ctx.restore()

  move: ->
    if @wait++ == @waitLimit
      @wait = 0
      @points += swGame.levelBonus.ptByKill
      @killCount++
  completedCondition: -> @killCount == swGame.level.getKillCount()


class swGame.levelBonus.showContinue extends swGame.levelBonus.base
  continueImage: swGame.images.add "#{swGame.settings.assetsPath}/ui/play.png"
  condition: -> true
  drawBonus: ->
    @ctx.save()
    @ctx.translate @bonusPtX + 20, @bonusY - 40
    @ctx.scale 0.5, 0.5
    @ctx.drawImage @continueImage, 0, 0
    @ctx.restore()
