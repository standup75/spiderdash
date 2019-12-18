class swGame.Centistache extends swGame.Centipede
  "use strict"
  spriteImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/centistache.png"
  @include swGame.gearable
  vector: null
  # see sprite.js.coffee to see how the settings are working
  settings:
    # determine speed of the sprite
    speed: 16
    # number of points killing it is worth
    value: 0
    podCount: 25
  points: 0
  isEnemy: false

  postInit: ->
    @points = 0
    @vector = swGame.Point.make 1,0
    @subscribe "turn", @turn
    @subscribe "touch", @touch
    @subscribe "secretPoints", @cashPoints
    super

  movePods: ->
    @location = @location.getCopy()
    @location.x = @location.x + @vector.x * @speed
    @location.y = @location.y + @vector.y * @speed
    rect = @_getHeadRect @location
    intersectionPathIndex = @globals.path.crossesRect rect, true
    rect = rect.unmake()
    unless intersectionPathIndex is false
      @die()
      swGame.levelBonus.showSecret(@points) 


  turn: (x, y) =>
    @vector.x = x
    @vector.y = y

  touch: (x, y) =>
    @vector.x = x - @location.x
    @vector.y = y - @location.y
    @vector.normalize()

  destroy: =>
    super
    @vector = @vector?.unmake()
    
  cashPoints: (pt) => @points += pt

  _getHeadRect: (location) ->
    reduction = Math.round @podWidth / 5
    swGame.Segment.make [location.x + reduction, location.y + reduction], [location.x + @podWidth - reduction, location.y + @podHeight - reduction]
