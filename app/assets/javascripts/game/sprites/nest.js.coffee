class swGame.Nest extends swGame.SpriteOnPath
  "use strict"
  ladybugCount = 0
  maxLadybugCount = 30
  spriteImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/nest.png"
  foetusImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/ladybug_foetus.png"
  entry:
    x: 70
    y: 40
    width: 40
    height: 40
  bugName: "Ladybug"

  settings:
    # speed range of the ladybugs
    speedRangeMin: 4
    speedRangeMax: 14
    # number of points killing it is worth
    value: 120
    # frequency at which ladybugs are created    
    frequency: 80
    cycleCountInNest: 100

  isPregnant: null
  foetusState: null

  postInit: ->
    ladybugCount = 0
    @isPregnant = false
    @subscribe "pathUpdated", @killMeMaybe
    @subscribe "someoneJustDied", @decreaseLadybugCount
    super
    @entryRect = @_getEntryRect()
    @center = @entryRect.center()
    @drawFirst()
    
  move: ->

  redraw: ->
    @ctx.save()
    @translateAndRotate()
    @ctx.drawImage @spriteImage, -@width, -@height
    @_redrawNest()
    @ctx.restore()

  killMeMaybe: =>
    return if @isDying
    @die() if !@center.isInsidePath(@globals.path) and !@entryRect.p1.isInsidePath(@globals.path) and !@entryRect.p2.isInsidePath(@globals.path)

  destroy: =>
    @entryRect = @entryRect.unmake()
    @center = @center.unmake()
    super

  decreaseLadybugCount: (sprite) =>
    ladybugCount-- if sprite.name is @bugName

  redrawFoetus: ->
    if @foetusState >= @cycleCountInNest - 20
      xShift = 2
    else
      xShift = if (@foetusState % 40) < 20 then 0 else 1
    width = @foetusImage.width / 3
    #console.log xShift * width, @foetusState
    @ctx.drawImage @foetusImage, xShift * width, 0, width, @foetusImage.height, -@width / 2, -@foetusImage.height, width, @foetusImage.height

  getDyingSpriteLocation: ->
    [@center.x, @center.y]

  _redrawNest: ->
    if @isPregnant
      @foetusState++
      if @foetusState is @cycleCountInNest
        @isPregnant = false
        @_createBug()
        @reSubscribeToRepaint()
      @redrawFoetus()
    else
      if ladybugCount < maxLadybugCount and Math.floor(Math.random() * @frequency) is 0
        @isPregnant = true
        @foetusState = 0

  _createBug: ->
    ladybugCount++
    position = @getPosition()
    bug = swGame[@bugName].make
      speed: @speedRangeMin + Math.floor(Math.random() * (@speedRangeMax - @speedRangeMin))
      x: if position is 1 then @entryRect.p1.x else if position is 3 then @entryRect.p2.x else @center.x
      y: if position is 2 then @entryRect.p1.y else if position is 0 then @entryRect.p2.y else @center.y
      clockwise: if Math.floor(Math.random() * 2) then 1 else -1
    bug.checkIsInside()

  _getEntryRect: ->
    switch @getPosition()
      when 0
        swGame.Segment.make [@location.x + @entry.x - @width, @location.y + @entry.y - @height], [@location.x + @entry.x + @entry.width - @width, @location.y + @entry.y + @entry.height - @height - 1]
      when 1
        swGame.Segment.make [@location.x + 1, @location.y + @entry.x - @width], [@location.x + @entry.height, @location.y + @entry.x + @entry.width - @width]
      when 2
        swGame.Segment.make [@location.x + @width - @entry.x, @location.y + 1], [@location.x + @width - (@entry.x + @entry.width), @location.y + @entry.height]
      when 3
        swGame.Segment.make [@location.x - @height + @entry.y - 1, @location.y + @width - @entry.x], [@location.x - @height + @entry.y + @entry.height, @location.y + @width - (@entry.x + @entry.width)]
