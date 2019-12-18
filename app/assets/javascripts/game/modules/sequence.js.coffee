swGame.sequence = do ->
  step = repaintCount = limit = lineHeight = 0
  direction = sequence = player = pointer = null

  subscriptions = {}
  subscribe = (event, fct) -> swGame.Subscriptions.subscribe.call(subscriptions, event, fct)
  unsubscribe = (event) -> swGame.Subscriptions.unsubscribe.call(subscriptions, event)

  steps =
    level0_1: [
      limit: 0
      redraw: ->
        pubsub.publish "freeze"
        skippable()
      finish: -> player.defrost()
    ,
      limit: 66
      redraw: ->
        drawMessage "Help the spider", 5, 2
        drawMessage "spin his web", 5, 3
      finish: ->
        player.freezeUp()
        direction = direction?.unmake()
    ,
      limit: "wait"
      redraw: ->
        unless pointer
          pointer = swGame.Pointer.make
            x: 5 * lineHeight
            y: lineHeight
            angle: (7*Math.PI)/4
        if swGame.device.touch
          drawMessage "Tap here to", 6, 2.5
          drawMessage "start spinning", 6, 3.5
        else
          drawMessage "Click the down arrow", 6, 2.5
          drawMessage "to start spinning", 6, 3.5
        waitForPlayerToGo 0, 1
      finish: ->
        player.defrost()
        pointer = pointer?.unmake()
    ,
      limit: 66
      finish: -> player.freezeUp()
    ,
      limit: "wait"
      redraw: ->
        unless pointer
          pointer = swGame.Pointer.make
            x: 3.5 * lineHeight
            y: 5.5 * lineHeight
            angle: (7*Math.PI)/4
        if swGame.device.touch
          drawMessage "Tap here to turn", 4.5, 7
        else
          drawMessage "Use the left", 4.5, 7
          drawMessage "arrow to turn", 4, 8
        waitForPlayerToGo -1, 0
      finish: ->
        player.defrost()
        pointer = pointer?.unmake()
    ,
      limit: "wait"
      redraw: -> goToNextStep() if not player.direction
      finish: -> player.freezeUp()
    ,
      limit: 70
      redraw: ->
        drawMessage "Congratulation!", 4, 2
        drawMessage "You spun your first web!", 4, 3
    ,
      limit: 110
      redraw: ->
        drawMessage "You lose", 4, 2
        drawMessage "if the Centipede", 4, 3
        drawMessage "cuts your silk", 4, 4
        pubsub.publish("circleCentipede")
    ,
      limit: 130
      redraw: ->
        drawMessage "Cover the stage with webs or", 4, 3
        drawMessage "kill the centipede to win", 4, 4
    ,
      limit: 100
      redraw: ->
        drawMessage "Good Luck!", 5, 3
        drawMessage("3...", 5, 4) if repaintCount>30
        drawMessage("2...", 6.5, 4) if repaintCount>50
        drawMessage("1...", 8, 4) if repaintCount>70
        drawMessage("Go!", 9.5, 4) if repaintCount>90
    ,
      limit: "wait"
      redraw: -> endSequence()
    ]
    level0_2: [
      limit: 0
      redraw: ->
        pubsub.publish "freeze"
        skippable()
    ,
      limit: 110
      redraw: ->
        drawMessage "Don't touch", 4, 2
        drawMessage "the skulls!", 4, 3
        pubsub.publish("circleDeath")
    ,
      limit: "wait"
      redraw: -> endSequence()
    ]
    level0_3: [
      limit: 0
      redraw: ->
        pubsub.publish "freeze"
        skippable()
    ,
      limit: 160
      redraw: ->
        drawMessage "Touch the stars to collect", 4, 2
        drawMessage "them and access new worlds", 4, 3
        pubsub.publish("circleStar")
    ,
      limit: "wait"
      redraw: -> endSequence()
    ]
    starKilled: [
      limit: 0
      redraw: ->
        pubsub.publish "freeze"
    ,
      limit: 130
      redraw: ->
        drawMessage "Ooops, closing the web removes the star", 4, 2
        drawMessage "Try again!", 4, 3
      finish: ->
        endSequence()
        pubsub.publish "retry"
    ]
    starCaught1: [
      limit: 0
      redraw: ->
        pubsub.publish "freeze"
        skippable()
    ,
      limit: 60
      redraw: ->
        drawMessage "Congrats! You got", 4, 2
        drawMessage "your first star", 4, 3
      finish: -> endSequence()
    ]
    starCaught2: [
      limit: 0
      redraw: ->
        pubsub.publish "freeze"
        skippable()
    ,
      limit: 60
      redraw: ->
        drawMessage "Second stars caught", 4, 2
        drawMessage "one more to go", 4, 3
      finish: -> endSequence()
    ]
    starCaught3: [
      limit: 0
      redraw: ->
        pubsub.publish "freeze"
        skippable()
    ,
      limit: 80
      redraw: ->
        drawMessage "Congrats, you got the 3 stars", 4, 2
        drawMessage "Spin more webs to finish the level.", 4, 3
      finish: -> endSequence()
    ]
    level0_4: [
      limit: 0
      redraw: ->
        pubsub.publish "freeze"
        skippable()
    ,
      limit: 110
      redraw: ->
        drawMessage "Ladybugs stay on the path", 4, 2
        drawMessage "Avoid them or kill them!", 4, 3
        pubsub.publish("circleLadybug")
    ,
      limit: "wait"
      redraw: -> endSequence()
    ]
    level0_5: [
      limit: 0
      redraw: ->
        pubsub.publish "freeze"
        skippable()
    ,
      limit: 110
      redraw: ->
        drawMessage "Catch this to double", 4, 2
        drawMessage "your speed for a few seconds", 4, 3
        pubsub.publish("circleSpeed")
    ,
      limit: "wait"
      redraw: -> endSequence()
    ]
    level0_7: [
      limit: 0
      redraw: ->
        pubsub.publish "freeze"
        skippable()
    ,
      limit: 110
      redraw: ->
        drawMessage "The Ladybugs won't kill you", 4, 2
        drawMessage "if you hide behind your hat", 4, 3
        pubsub.publish("circleLadybug")
    ,
      limit: "wait"
      redraw: ->
        if swGame.device.touch
          drawMessage "Tap here to hide", 2, 1.5
          y = 0
        else
          drawMessage "Click the up arrow to hide", 2, 2.5
          y = 1
        unless pointer
          pointer = swGame.Pointer.make
            x: 1 * lineHeight
            y: y * lineHeight
            angle: (7*Math.PI)/4
        waitForPlayerToGo 0, -1
        pubsub.subscribe "crouch", goToNextStep
      finish: ->
        pubsub.unsubscribe "crouch", goToNextStep
        player.defrost()
        pointer = pointer?.unmake()
    ,
      limit: 110
      redraw: ->
        drawMessage "You got it.", 3, 3.5
        drawMessage "Now get up and spin!", 3, 4.5
    ,
      limit: "wait"
      redraw: -> endSequence()
    ]
    level0_24: [
      limit: 0
      redraw: ->
        pubsub.publish "freeze"
    ,
      limit: 300
      redraw: ->
        drawMessage "This is the end of our Beta", 4, 1
        drawMessage "More levels and worlds soon...", 4, 2
        drawMessage "(btw, congrats, I really did not expect", 4, 10.5
        drawMessage "anyone to reach this point...)", 4, 11.5
      finish: ->
        endSequence()
        pubsub.publish "showHome"
    ]
    greenMustache: [
      limit: 110
      redraw: ->
        unless pointer
          pointer = swGame.Pointer.make
            x: 7.8 * lineHeight
            y: 0.6 * lineHeight
        drawMessage "Green Mustache!", 4, 2
        drawMessage "Wouldn't you look cool with that?", 4, 3
      finish: ->
        pointer = pointer.unmake()
        endSequence()
    ]
    noMustache: [
      limit: 110
      redraw: ->
        [x, y] = swGame.mustache.getLocation()
        unless pointer
          pointer = swGame.Pointer.make
            x: x + 10
            y: y + 0.5 * lineHeight
        starCount = swGame.profile.getRemainingStarCount()
        drawMessage "You need #{starCount} more", x / lineHeight - 1, y / lineHeight + 2
        drawMessage "star#{if starCount is 1 then "" else "s"} to get this mustache", x / lineHeight - 1, y / lineHeight + 3
      finish: ->
        pointer = pointer.unmake()
        endSequence()
    ]
    level2_1: [
      limit: 0
      redraw: ->
        pubsub.publish "freeze"
        skippable()
    ,
      limit: 110
      redraw: ->
        unless pointer
          pointer = swGame.Pointer.make
            x: 8 * lineHeight
            y: lineHeight
            angle: (7*Math.PI)/4
        drawMessage "Silk won't stick on ice", 9, 2.5
        waitForPlayerToGo 0, -1
      finish: ->
        player.defrost()
        pointer = pointer?.unmake()
    ,
      limit: "wait"
      redraw: -> endSequence()
    ]

  # helpers

  redraw = ->
    sequence[step]?.redraw?()
    incRepaintCount()

  incRepaintCount = ->
    if limit isnt "wait"
      repaintCount++
      goToNextStep() if repaintCount>limit

  goToNextStep = ->
    repaintCount = 0
    sequence[step].finish?()
    step++
    limit = sequence[step]?.limit

  waitForPlayerToGo = (x, y) ->
    if direction and direction.x is x and direction.y is y
      player.turn direction.x, direction.y
      goToNextStep()

  drawMessage = (txt, x, y, ratio) ->
    ratio = ratio || 1
    x = x * lineHeight
    y = y * lineHeight
    ctx = swGame.globals.ctx
    ctx.save()
    ctx.lineWidth = 2
    swGame.helpers.setFontStyle ctx, ratio * lineHeight/2
    swGame.helpers.drawText ctx, txt, x, y
    ctx.restore()

  takeControl = ->
    player.unsubscribe "turn"
    player.unsubscribe "touch"
    subscribe "turn", turn
    subscribe "touch", touch

  releaseControl = ->
    player.subscribe "turn", player.turn
    player.subscribe "touch", player.touch
    unsubscribe "turn"
    unsubscribe "touch"

  turn = (x, y) ->
    direction = direction?.unmake()
    direction = swGame.Point.make x, y
  touch = (x, y) ->
    direction = direction?.unmake()
    direction = player.getTouchDirection(x, y)
  skippable = ->
    swGame.ui.showSkipButton()
    subscribe "select", endSequence

  # normal sequence (freezing)

  startSequence = ->
    takeControl() if player
    subscribe "repaint_done", redraw

  endSequence = ->
    direction = direction?.unmake()
    pointer = pointer?.unmake()
    releaseControl() if player
    swGame.ui.hideSkipButton()
    unsubscribe()
    pubsub.publish "move"
    player = null

  start: (sequenceName, _player, skipEvents = ["showHome"]) ->
    player = _player
    sequence = steps[sequenceName]
    return unless sequence
    step = repaintCount = 0
    limit = sequence[0].limit
    lineHeight = Math.round swGame.globals.width / 20
    subscribe(event, endSequence) for event in skipEvents
    setTimeout startSequence, 0

