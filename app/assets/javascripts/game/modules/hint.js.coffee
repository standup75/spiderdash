swGame.hint = do ->
  "use strict"
  hintImage = swGame.images.add "#{swGame.settings.assetsPath}/hint_frame.png"
  level = null

  getHint = ->
    if level.hint
      level.hint
    else
      hints = swGame.world.getHint()?.split ";"
      if hints
        worldsAvailableStars = swGame.world.getLevelCount() * 3
        firstHintStarCount = worldsAvailableStars - hints.length * 3
        starCount = swGame.profile.getWorldStarCount swGame.world.getWorldIndex(), swGame.level.getCurrentCheckpoint().index
        starCount -= 3 if starCount is worldsAvailableStars
        hintIndex = Math.floor (starCount - firstHintStarCount) / 3
        #console.log "hints: ", hints, worldsAvailableStars, firstHintStarCount, starCount, hintIndex
        if hintIndex >= 0
          level.hint = hints[hintIndex]
          level.hint
        else
          null

  drawHint = (hint) ->
    ctx = swGame.globals.ctxBackground
    x = swGame.globals.width - hintImage.width - 2 * level.tileWidth
    y = swGame.globals.height - hintImage.height - level.tileHeight
    ctx.drawImage hintImage, x, y
    ctx.save()
    ctx.translate x, y
    ctx.rotate -Math.PI / 16
    ctx.fillStyle = "#666"
    size = setFont ctx, hint
    ctx.fillText hint, 10 + Math.floor((106 - size.width) / 2), 70
    ctx.restore()

  setFont = (ctx, hint) ->
    fontSize = 24 * swGame.settings.pixelRatio
    size = { width: 200 }
    while size.width > 100
      ctx.font = "bold #{fontSize--}px stencilia"
      size = ctx.measureText hint
    size

  show = (cp, isDemo) ->
    level = cp.level
    drawHint(hint) if not isDemo and cp.kind isnt swGame.globals.CHECKPOINT_BONUS_LEVEL and hint = getHint()

  pubsub.subscribe "levelReady", show