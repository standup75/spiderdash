class swGame.Branch extends swGame.SpriteInsidePath
  "use strict"
  spriteImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/branch.png"
  spriteBlueImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/branch_blue.png"

  # see sprite.js.coffee to see how the settings are working
  settings:
    # number of points killing it is worth
    value: 250

  # determine size of the branch (in pixel)
  height: 66
  # branch minimum size (if it becomes smaller, it dies)
  @minWidth: 60
  # will be defined during init:
  width: null
  # segment of the path where the branch is anchored
  ends: null

  # Sprite interface
    
  # we use init and not postInit, because we don't need the pictures,
  # but we need to be sure that it can publish its location on init_doen for its guests
  init: ->
    super
    growth = 1
    path =  @globals.path
    while true
      seg = @_getBranchAsSegment @location, growth++
      beginPt = seg.p1.getCopy() if not beginPt and path.contains seg.p1, true
      endPt = seg.p2.getCopy() if not endPt and path.contains seg.p2, true
      seg = seg.unmake()
      break if beginPt and endPt
    @location.unmake()
    beginPt.x++
    endPt.x--
    @ends = swGame.Segment.make beginPt, endPt
    beginPt = beginPt.unmake()
    endPt = endPt.unmake()
    @location = @ends.p1.getCopy()
    @width = @ends.p2.x - @location.x
    @xSrc = Math.floor Math.random() * (@spriteImage.width - @width - 8)
    @subscribe "levelReady", @broadcastLocation
    @drawFirst()
    #@ends.drawRect @globals.ctxBackground
    #@globals.ctxBackground.strokeRect @ends.p1.x, @ends.p1.y + @spriteImage.height - 5, @width, 1

  redraw: ->
    if not @isDying
      if @globals.isOnPill
        @die() if @_punched()
        image = @spriteBlueImage
      else
        image = @spriteImage
      @ctx.drawImage image, @xSrc, 0, @width + 8, @height, @location.x - 4, @location.y, @width + 8, @height

  die: ->
    super
    pubsub.publish "branchIsDying", @

  # SpriteInsidePath interface

  getRect: -> swGame.Segment.make @ends.p1, [@ends.p2.x, @ends.p2.y + @height]

  # private methods

  _getBranchAsSegment: (location, growth) ->
    growth or= 1
    seg = swGame.Segment.make([location.x-growth, location.y], [location.x+growth, location.y])
    console.error("no place found for this branch", @) if growth > @globals.width
    seg

  getDyingSpriteLocation: ->
    [Math.round(@location.x + (@width - @spriteDiesWidth) / 2), Math.round(@location.y + (@height - @spriteDiesHeight) / 2)]

  # events

  destroy: =>
    @ends = @ends?.unmake()
    super

  broadcastLocation: => pubsub.publish "branchLocation", @

  killMeMaybe: =>
    path = @globals.path
    cross = @ends.getIntersection path
    isP1Inside = @ends.p1.isInsidePath path
    isP2Inside = @ends.p2.isInsidePath path
    if not isP1Inside and not isP2Inside
      p3 = @ends.p1.getCopy()
      p3.y += @spriteImage.height - 5
      p4 = @ends.p2.getCopy()
      p4.y += @spriteImage.height - 5
      # otherwise, slicing the branch horizontally would kill it
      @die() if not p3.isInsidePath(path) and not p4.isInsidePath(path)
      p3 = p3.unmake()
      p4 = p4.unmake()
    # if the path crosses the branch and one of its extremity is outside the path
    # So that if the spider tries to "cut" the branch in 2, it still works,
    # although some leaves will start outside the path (no big deal)
    else if cross and not (isP1Inside and isP2Inside)
      if isP1Inside
        cross.intersection.x--
        newEnds = swGame.Segment.make @ends.p1, cross.intersection
      else if isP2Inside
        cross.intersection.x++
        newEnds = swGame.Segment.make cross.intersection, @ends.p2
      if cross.intersection.isInsidePath(path)
        if newEnds.horizontalSize() >= swGame.Branch.minWidth
          pubsub.publish "updateBranchSize", newEnds
          @ends = @ends.unmake()
          @ends = newEnds
        else @die()
    cross.intersection = cross.intersection.unmake() if cross
