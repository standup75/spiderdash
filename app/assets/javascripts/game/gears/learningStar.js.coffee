class swGame.LearningStar extends swGame.Star
  "use strict"
  sequenceLaunched: false
  postInit: ->
    @sequenceLaunched = false
    @isActivated = false
    @unsubscribe "pathUpdated", @mayKillGear
    @subscribe "destroysWeb", @destroysWeb
    super
  repaint: =>
    if @isDying and not @sequenceLaunched
      swGame.sequence.start("starKilled")
      @sequenceLaunched = true
    super
  activateGear: ->
    @isActivated = true
    swGame.sequence.start "starCaught#{@getStarCount() + 1}"
    super
  destroysWeb: (path) =>
    # no check if the gear has been caught (ie. has the sprite assigned to it)
    return false if @sprite
    # check if the stare is inside the path
    rect = @getRect()
    @isDying = rect.p1.isInsidePath(path) or rect.p2.isInsidePath(path)
    rect = rect.unmake()
    @isDying
