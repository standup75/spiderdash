class swGame.RoachNest extends swGame.Nest
  spriteImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/roach_nest.png"
  foetusImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/roach_foetus.png"
  bugName: "Roach"
  entry:
    x: 60
    y: 80
    width: 40
    height: 70

  settings:
    # speed range of the ladybugs
    speedRangeMin: 8
    speedRangeMax: 18
    # number of points killing it is worth
    value: 180
    # frequency at which ladybugs are created    
    frequency: 80
    cycleCountInNest: 100

  redrawFoetus: ->
    if @foetusState >= @cycleCountInNest - 20
      xShift = 2
    else
      xShift = if (@foetusState % 40) < 20 then 0 else 1
    width = @foetusImage.width / 3
    #console.log xShift * width, @foetusState
    @ctx.drawImage @foetusImage, xShift * width, 0, width, @foetusImage.height, -@width / 2 - 20, -@foetusImage.height - 6, width, @foetusImage.height
