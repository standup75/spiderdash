class swGame.Star extends swGame.Gear
  "use strict"
  starCount = 0
  frameDuration: 6
  spriteImage: swGame.images.add "#{swGame.settings.assetsPath}/gears/Star.png"
  getStarCount: -> starCount
  postInit: ->
    super
    starCount = 0
    @goalLocation = null
  activateGear: ->
    swGame.profile.addStar()
    @unsubscribe "pathUpdated"
    @unsubscribe "mayCatchGear"
    @goalLocation = swGame.Point.make 35 + 60 * starCount, 185
    @exoskelton = null
    @stepCount = Math.ceil(Math.max(Math.abs(@goalLocation.y-@location.y), Math.abs(@goalLocation.x-@location.x))/(10 * swGame.settings.pixelRatio))
    @yStep = (@goalLocation.y-@location.y)/@stepCount
    @xStep = (@goalLocation.x-@location.x)/@stepCount
    pubsub.publish "playFx", "star#{starCount + 1}"
  preDrawFilter: ->
    if @goalLocation
      if @stepCount == 0
        @goalLocation = @goalLocation.unmake()
        @unmake()
        starCount++
        swGame.ui.showStars starCount
      else
        @location.x += @xStep
        @location.y += @yStep
        x = Math.round(@location.x-@imageWidth/2)
        y = Math.round(@location.y-@imageHeight/2)
        @stepCount--
        @ctx.drawImage @spriteImage, 0, 0, @imageWidth, @imageHeight, x, y, @imageWidth, @imageHeight



