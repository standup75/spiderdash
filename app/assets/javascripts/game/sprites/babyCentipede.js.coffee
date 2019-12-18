class swGame.BabyCentipede extends swGame.Centipede
  "use strict"
  spriteImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/baby_centipede.png"
  podSpriteImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/baby_centipede_pods.png"
  spriteBlueImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/baby_centipede_blue.png"
  podSpriteBlueImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/baby_centipede_pods_blue.png"
  # see sprite.js.coffee to see how the settings are working
  settings:
    # determine speed of the sprite
    speed: 12
    # number of points killing it is worth
    value: 30
    # determine how much the ennemy will rotate
    threshold: Math.PI/8
    # determine how fast the ennemy can change direction
    maxAngleDiff: Math.PI/3
    podCount: 25
  podWidth: 58
  podHeight: 32
