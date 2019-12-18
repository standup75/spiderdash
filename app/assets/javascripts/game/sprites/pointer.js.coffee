class swGame.Pointer extends swGame.CanvasObject
  "use strict"
  spriteImage: swGame.images.add "#{swGame.settings.assetsPath}/sprites/pointer.png"
  frameCount: 20
  frameDuration: 1
  settings:
    angle: 0
    x: 0
    y: 0

  redraw: (frameNumber) ->
    @ctx.save()
    @ctx.translate Math.floor(@x + @spriteImage.height / 2), Math.floor(@y + @spriteImage.width / 2)
    @ctx.rotate @angle
    halfway = @frameCount / 2
    scale = if frameNumber >= halfway then @frameCount - frameNumber else frameNumber
    scale = scale / 30
    @ctx.scale 0.6+scale, 0.6+scale
    @ctx.drawImage @spriteImage, -Math.floor(@spriteImage.height / 2), -Math.floor(@spriteImage.width / 2)
    @ctx.restore()
