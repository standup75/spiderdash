class swGame.Butterfly extends swGame.Fly
  "use strict"
  spriteImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/butterfly.png"
  spriteBlueImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/butterfly_blue.png"

  # see sprite.js.coffee to see how the settings are working
  settings:
    # determine speed of the sprite
    speed: 22
    # number of points killing it is worth
    value: 150
    # determine how fast the ennemy can change direction
    maxAngleDiff: Math.PI / 4
    # determine how much the ennemy will rotate
    threshold: Math.PI / 4
    panicAngle: Math.PI / 32
    canSmell: false
    scale: 1
  
  # instance objects
  # cannot by initialized here
  # See http://html5stars.com/?p=148
  vector: null
  # determine size of the fly (in pixel)
  width: 80
  height: 80
  # number of sprites for the animation of the fly
  frameCount: 10
  