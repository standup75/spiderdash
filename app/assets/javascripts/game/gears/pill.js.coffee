class swGame.Pill extends swGame.TimeGear
  "use strict"
  spriteImage: swGame.images.add "#{swGame.settings.assetsPath}/gears/Pill.png"
  activateGear: ->
    @globals.isOnPill = true
  deactivateGear: ->
    @globals.isOnPill = false

