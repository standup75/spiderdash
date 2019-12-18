class swGame.Death extends swGame.Gear
  "use strict"
  spriteImage: swGame.images.add "#{swGame.settings.assetsPath}/gears/Death.png"
  bounce: false
  circleColor: "#dd310a"
  settings:
    value: 10

  activateGear: ->
    @sprite.die() unless @sprite.protection > 0 or @sprite.freeze
    @sprite = null
    @subscribeBoardEvent()
