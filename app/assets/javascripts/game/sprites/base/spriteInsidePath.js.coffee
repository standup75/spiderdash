class swGame.SpriteInsidePath extends swGame.Sprite
  "use strict"

  getExoskelton: -> false

  getBorders: ->
    exoskelton = @getExoskelton()
    if not exoskelton
      rect = @getRect()
      exoskelton = [swGame.Point.make(rect.p1.x, rect.p1.y), swGame.Point.make(rect.p1.x, rect.p2.y), swGame.Point.make(rect.p2.x, rect.p2.y), swGame.Point.make(rect.p2.x, rect.p1.y)]
      rect.unmake()
    exoskelton
    
  postInit: ->
    @subscribe "pathUpdated", @killMeMaybe
    @subscribe "punch", @punched
 
  redraw: ->
    # check if the ennemy hits the player's drawing path
    if @globals.isOnPill
      @die() if @_punched()
    else
      pubsub.publish("collision") if @hitPath(@globals.drawingPath) isnt false

  _punched: ->
    x = @globals.player.x
    y = @globals.player.y
    punchRect = swGame.Segment.make [x - 46, y - 34], [x + 46, y + 32]
    if not @isDying
      exoskelton = @getBorders()
      killed = punchRect.crossesPathAsRect exoskelton
      pt = pt.unmake() for pt in exoskelton
      @die() if killed
    punchRect = punchRect.unmake()
 
  hitPath: (path)->
    return false unless path.length()
    rect = @getRect()
    res = path.crossesRect rect
    rect = rect.unmake()
    if res isnt false and exoskeltonPath = @getExoskelton()
      res = path.crossesPath exoskeltonPath, false
      pt = pt.unmake() for pt in exoskeltonPath
    res

  die: ->
    swGame.profile.updateScore(@value) if @value
    super

  # events
      
  killMeMaybe: =>
    isInside = @globals.path.contains(@location, true) or @location.isInsidePath(@globals.path)
    @die() unless @isDying or isInside
