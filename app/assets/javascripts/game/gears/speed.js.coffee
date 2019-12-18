class swGame.Speed extends swGame.TimeGear
  "use strict"
  speedDiff: 2
  spriteImage: swGame.images.add "#{swGame.settings.assetsPath}/gears/Speed.png"
  activateGear: ->
    @globals.playerSpeed *= @speedDiff
  deactivateGear: ->
    @globals.playerSpeed /= @speedDiff
    @sprite = null
