class swGame.OrangeLeaf extends swGame.Leaf
  "use strict"
  spriteImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/orange_leaf.png"
  spriteDiesImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/orange_leaf_dies.png"
  spriteBlueImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/orange_leaf_blue.png"
  spriteDiesBlueImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/orange_leaf_dies_blue.png"
  
  # see sprite.js.coffee to see how the settings are working
  settings:
    # number of points killing it is worth
    value: 0
    # where the leaf should be on the branch in percent, if false, it will be randomly placed
    placement: false
    # if true: @sign, @threshold and @maxAngleDiff will be chosen at random
    randomWind: true
    # determine direction of the wind
    sign: 1
    # determine speed of the sprite
    speed: 22
    # gravity (100 is max)
    gravity: 8
    # determine how much the ennemy will rotate
    p1: 0.8
    # determine how fast the ennemy can change direction
    p2: 25

  width: 30
