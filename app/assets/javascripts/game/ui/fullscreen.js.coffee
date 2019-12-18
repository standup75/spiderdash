swGame.fullscreen = do ->
  fullScreenApi = (->
    fullScreenApi =
      supportsFullScreen: false
      isFullScreen: -> false
      requestFullScreen: ->
      cancelFullScreen: ->
      toggle: ->
      fullScreenEventName: ""
      prefix: ""

    browserPrefixes = "webkit moz o ms khtml".split(" ")
    
    # check for native support
    unless typeof document.cancelFullScreen is "undefined"
      fullScreenApi.supportsFullScreen = true
    else
      # check for fullscreen support by vendor prefix
      i = 0
      il = browserPrefixes.length
      while i < il
        fullScreenApi.prefix = browserPrefixes[i]
        unless typeof document[fullScreenApi.prefix + "CancelFullScreen"] is "undefined"
          fullScreenApi.supportsFullScreen = true
          break
        i++
    
    # update methods to do something useful
    if fullScreenApi.supportsFullScreen
      fullScreenApi.fullScreenEventName = fullScreenApi.prefix + "fullscreenchange"
      fullScreenApi.isFullScreen = ->
        switch @prefix
          when ""
            document.fullScreen
          when "webkit"
            document.webkitIsFullScreen
          else
            document[@prefix + "FullScreen"]

      fullScreenApi.requestFullScreen = (el) ->
        (if (@prefix is "") then el.requestFullScreen() else el[@prefix + "RequestFullScreen"]())

      fullScreenApi.cancelFullScreen = ->
        (if (@prefix is "") then document.cancelFullScreen() else document[@prefix + "CancelFullScreen"]())

      fullScreenApi.toggle = (el) ->
        (if (fullScreenApi.isFullScreen()) then fullScreenApi.cancelFullScreen() else fullScreenApi.requestFullScreen(el))
    fullScreenApi
  )()

  fullscreenContentEl = null
  fullscreenEl = null
  fullscreenChanged = ->
    if fullScreenApi.isFullScreen()
      fullscreenEl.className = "css_sprite-windowed"
    else
      fullscreenEl.className = "css_sprite-fullscreen"
  toggleFullscreen = ->
    pubsub.publish("pause", true) if swGame.level.isPlaying()
    fullScreenApi.toggle fullscreenContentEl
  init = ->
    fullscreenContentEl = document.getElementsByTagName("body")[0]
    fullscreenEl = document.getElementById "fullscreen"
    if not swGame.device.mobile and swGame.globals.frameEl and fullScreenApi.supportsFullScreen
      fullscreenEl.className = "css_sprite-windowed" if fullScreenApi.isFullScreen()
      fullscreenEl.style.display = "block"
      fullscreenEl.addEventListener "mousedown", toggleFullscreen
      document.addEventListener fullScreenApi.fullScreenEventName, fullscreenChanged
  pubsub.subscribe "init", init