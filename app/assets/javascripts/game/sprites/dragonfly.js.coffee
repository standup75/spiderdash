class swGame.Dragonfly extends swGame.Fly
  "use strict"
  spriteImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/dragonfly.png"
  spriteBlueImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/dragonfly_blue.png"

  # see sprite.js.coffee to see how the settings are working
  settings:
    # determine speed of the sprite
    speed: 20
    # number of points killing it is worth
    value: 150
    # determine how fast the ennemy can change direction
    maxAngleDiff: Math.PI / 32
    # determine how much the ennemy will rotate
    threshold: Math.PI / 16
    panicAngle: Math.PI / 32
    canSmell: true
    scale: 1
  
  # instance objects
  # cannot by initialized here
  # See http://html5stars.com/?p=148
  vector: null
  # determine size of the fly (in pixel)
  width: 100
  height: 80
  # number of sprites for the animation of the fly
  frameCount: 8
