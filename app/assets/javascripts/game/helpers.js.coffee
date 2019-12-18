# some global functions that did not deserve their own modules yet
swGame.helpers = do ->
  "use strict"

  getTrace: (more, getAsHtml) ->
    stack = Error().stack.split("at ")
    stack.splice 0,3
    if getAsHtml
      "<span class='error-trace'>trace:</span>#{stack.join("<br/>")}<br/><br/><span class='error-more'>more</span>: #{JSON.stringify more}"
    else
      "trace: #{JSON.stringify stack}, more: #{JSON.stringify more}"

  setFontStyle: (ctx, size) ->
    ctx.font = "#{size}px akaDylan"
    ctx.fillStyle = "#f7f124"

  setFontStyleSmall: (ctx, size, color) ->
    ctx.font = "#{size}px akaDylan"
    ctx.fillStyle = color || "#fff"

  drawText: (ctx, text, x, y) ->
    ctx.fillText text, x, y
    ctx.strokeStyle = "rgba(0,0,0,0.5)"
    ctx.strokeText text, x, y

  isEmbedded: -> typeof Native isnt "undefined"

  extend: (dest, src) ->
    if src
      dest[key] = value for key, value of src
    dest

  drawEllipse: (ctx, x, y, w, h) ->
    kappa = .5522848
    ox = (w / 2) * kappa # control point offset horizontal
    oy = (h / 2) * kappa # control point offset vertical
    xe = x + w # x-end
    ye = y + h # y-end
    xm = x + w / 2 # x-middle
    ym = y + h / 2 # y-middle
    ctx.beginPath()
    ctx.moveTo x, ym
    ctx.bezierCurveTo x, ym - oy, xm - ox, y, xm, y
    ctx.bezierCurveTo xm + ox, y, xe, ym - oy, xe, ym
    ctx.bezierCurveTo xe, ym + oy, xm + ox, ye, xm, ye
    ctx.bezierCurveTo xm - ox, ye, x, ym + oy, x, ym
    ctx.stroke()

  # Usage:
  # swGame.helpers.ajax
  #   url: url
  #   type: "GET"       # optional, default is GET
  #   callback: fct     # optional, success callback
  #   params: params    # optional
  ajax: (args) ->
    # add filter
    prefix = if location.origin.match(/localhost/) then "" else "http://api.spiderdash.net"
    url = "#{prefix}#{args.url}"
    params = ""
    if args.params
      params += "#{key}=#{args.params[key]}&" for key of args.params
    # now build ajax request
    xhr = new XMLHttpRequest
    xhr.onreadystatechange = ->
      args.callback.call(xhr, xhr.responseText) if args.callback if xhr.readyState is 4
    xhr.open args.type || "GET", url, true
    xhr.setRequestHeader "Content-Type", "application/x-www-form-urlencoded"
    xhr.send params

# http://arcturo.github.com/library/coffeescript/03_classes.html
class swGame.Module
  moduleKeywords = ['extended', 'included']
  @extend: (obj) ->
    for key, value of obj when key not in moduleKeywords
      @[key] = value

    obj.extended?.apply(@)
    this

  @include: (obj) ->
    for key, value of obj when key not in moduleKeywords
      # Assign properties to the prototype
      @::[key] = value

    obj.included?.apply(@)
    this

# modules

swGame.PoolFactory = do ->
  freePool = {}
  duplicateCheck = (status) ->
    checked = status == "in use"
    if not checked
      console.log "called unmake one too many time"
      console.trace()
    checked

  make: ->
    newObj = freePool[@name]?.pop()
    if not newObj
      newObj = new swGame[@name]
      newObj.name = @name
    newObj.status = "in use"
    newObj.init.apply(newObj, arguments)
    newObj
  extended: ->
    @include
      unmake: ->
        #console.log("unmaking #{@name}", JSON.stringify(swGame.helpers.getTrace(@toString()))) if @name isnt "Segment" and @name isnt "Point"
        if duplicateCheck(@status)
          @destroy?()
          if freePool[@name]
            freePool[@name].push(@)
          else
            freePool[@name] = [@]

        @status = "free"
        null

swGame.Subscriptions =
  # save subscriptions in an array so we can unsubscribe on destroy
  subscriptions: null
  subscribe: (event, fct) ->
    pubsub.subscribe event, fct
    @subscriptions = [] unless @subscriptions?
    @subscriptions.push
      event: event
      fct: fct

  unsubscribe: (subscription) ->
    count = @subscriptions?.length
    while count--
      subs = @subscriptions[count]
      pubsub.unsubscribe(subs.event, subs.fct) if not subscription or subs.event == subscription
      @subscriptions.splice(count, 1) if subs.event == subscription
    @subscriptions = [] if not subscription

swGame.Spider =
  spiderImage: swGame.images.add "#{swGame.settings.assetsPath}/player/spider.png"
  mustacheImage: swGame.images.add "#{swGame.settings.assetsPath}/player/mustache.png"
  _spriteFrames:
    passive: 
      firstFrame: 0
      lastFrame: 5
    yeah:
      firstFrame: 6
      lastFrame: 12
      next: "passive"
    active: 
      firstFrame: 13
      lastFrame: 20
    crouching:
      firstFrame: 21
      lastFrame: 23
      next: "crouched"
    crouched:
      firstFrame: 24
      lastFrame: 24
    uncrouching:
      firstFrame: 25
      lastFrame: 27
      next: "passive"
    turningCc:
      firstFrame: 28
      lastFrame: 30
      frameDuration: 1
    turning:
      firstFrame: 31
      lastFrame: 33
      frameDuration: 1
    dying:
      firstFrame: 34
      lastFrame: 40
  _frameDuration: null
  _frameOffset: 0
  nextState: null
  spriteImage: null
  currentState: null

  initSpider: ->
    @_frameDuration = @frameDuration || 3
    @initSpriteImage()
    @initSpriteState "passive"
    @width = @spiderImage.width / (@_spriteFrames.dying.lastFrame + 1)
    @height = @spiderImage.height
    @subscribe "changeMustache", (=> @initSpriteImage())

  initSpriteState: (state) ->
    @_frameOffset = @_spriteFrames[state].firstFrame
    @frameCount = 1 + @_spriteFrames[state].lastFrame - @_frameOffset
    @nextState = @_spriteFrames[state].next
    @frameDuration = @_spriteFrames[state].frameDuration || @_frameDuration
    @switchSprite = 0
    @currentState = state

  getSpiderXSrc: (frameNumber) -> (@_frameOffset + frameNumber) * @width

  initSpriteImage: ->
    @spriteImage = document.createElement("canvas")
    @spriteImage.width = @spiderImage.width
    @spriteImage.height = @spiderImage.height
    ctx = @spriteImage.getContext("2d")
    ctx.drawImage @spiderImage, 0, 0
    @_paintMustache ctx

  _paintMustache: (ctx) ->
    mustacheCanvas = document.createElement("canvas")
    mustacheCanvas.width = @mustacheImage.width
    mustacheCanvas.height = @mustacheImage.height
    mustacheCtx = mustacheCanvas.getContext "2d"
    mustacheCtx.drawImage @mustacheImage, 0, 0
    colors = @_getColors()
    imageData = mustacheCtx.getImageData 0, 0, @mustacheImage.width, @mustacheImage.height
    index = imageData.data.length - 1
    while index > 0
      if imageData.data[index] isnt 0
        imageData.data[index - 3] = Math.round (imageData.data[index - 3] * colors.red) / 255
        imageData.data[index - 2] = Math.round (imageData.data[index - 2] * colors.green) / 255
        imageData.data[index - 1] = Math.round (imageData.data[index - 1] * colors.blue) / 255
      index -= 4
    mustacheCtx.putImageData imageData, 0, 0
    ctx.drawImage mustacheCanvas, 0, 0

  _getColors: ->
    color = swGame.settings.mustacheColors[swGame.profile.getMustacheIndex()]
    red: parseInt color.slice(0, 2), 16
    green: parseInt color.slice(2, 4), 16
    blue: parseInt color.slice(4, 6), 16
