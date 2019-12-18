swGame.mustache = do ->
  "use strict"

  mustacheImage = swGame.images.add "#{swGame.settings.assetsPath}/world_map/mustaches.png"
  mustacheWidth = 160
  mustacheHeight = 40
  stepCount = 20
  isActive = false
  halfway = stepCount / 2

  worldIndex = mustacheIndex = x = y = step = null

  hide = ->
    isActive = false
    pubsub.unsubscribe "repaint_done", repaint
  repaint = ->
    ctx = swGame.globals.ctx
    ctx.save()
    ctx.translate x + mustacheWidth / 4, y + mustacheHeight / 4
    if step?
      repaintCatchAnimation ctx
    else if mustacheIndex >= 0
      ctx.scale 0.5, 0.5
    ctx.drawImage mustacheImage, mustacheIndex * mustacheWidth, 0, mustacheWidth, mustacheHeight, -mustacheWidth / 2, -mustacheHeight / 2, mustacheWidth, mustacheHeight
    ctx.restore()
  repaintCatchAnimation = (ctx) -> 
    zoom = 0.5 + if step < halfway then step / stepCount else (stepCount - step) / stepCount
    swGame.profile.addMustache(worldIndex) if step is halfway
    ctx.scale zoom, zoom
    if step++ == stepCount
      hide() 
      pubsub.publish "move"
      pubsub.publish "changeMustache"

  pubsub.subscribe "newLevel", hide
  pubsub.subscribe "showHome", hide

  catchMustache: ->
    if isActive 
      hasEnoughStars = swGame.profile.getRemainingStarCount() is 0
      if hasEnoughStars
        pubsub.publish "playFx", "mustache"
        pubsub.publish "freeze"
        step = 0
      else
        swGame.sequence.start "noMustache", null, ["newLevel", "worldSwitch"]

  drawMustache: (_worldIndex, _x, _y) ->
    if not swGame.profile.hasMustache _worldIndex
      step = null
      isActive = true
      [worldIndex, mustacheIndex, x, y] = [_worldIndex, _worldIndex - 1, _x - 16, _y + 10]
      pubsub.subscribe "repaint_done", repaint
  getLocation: -> [x, y]
  hide: hide
