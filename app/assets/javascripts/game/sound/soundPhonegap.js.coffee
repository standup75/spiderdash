swGame.soundPhonegap = ->
  "use strict"

  mapMusic = gameMusic = themeId = isMusicOn = isFxOn = fxName = null
  isPaused = false
  mediaIds = {}
  options = (loopCount) ->
    numberOfLoops: loopCount
    playAudioWhenScreenIsLocked : false

  createMedias = (mediaNames) ->
    medias = {}
    createMedia = (name) -> new Media("#{swGame.settings.assetsPath}/#{name}.mp3", onSuccess, onError, mediaStatus(name))
    #createMedia = (name) ->
    #  res = new Howl({urls: ["#{swGame.settings.assetsPath}/#{name}.mp3", "#{swGame.settings.assetsPath}/#{name}.ogg"]})
    #  res.release = ->
    #  res._play = res.play
    #  res.play = -> res._play() # ignore arguments monkey patch
    #  res

    play: (name, options) ->
      medias[name] = createMedia(name) unless medias[name]
      medias[name].play()# options
    stop: (name) ->
      return unless medias[name]
      medias[name].stop()
      medias[name].release()
    pause: (name) ->
      return unless medias[name]
      medias[name].pause()

  onSuccess = -> console.log("media success: ", arguments)
  onError = -> console.log("media success: ", arguments)
  mediaStatus = (name) ->
    statuses = ["MEDIA_NONE", "MEDIA_STARTING", "MEDIA_RUNNING", "MEDIA_PAUSED", "MEDIA_STOPPED"]
    (status) -> console.log("sound #{name} has status: #{statuses[status]}")

  audioNames = ["lose", "boom", "star1", "star2", "star3", "web", "win", "mustache", "secret", "fall", "threading", "theme"]
  audioMedias = createMedias audioNames

  worldNames = ["Main", "Woods", "Mountain", "Beach", "Cave", "Color-hills", "Flying-dutchman", "Hell"]
  worldSongs = 
    maps: createMedias worldNames.map((n) -> "#{n}-map")
    games: createMedias worldNames, options(1)

  stopMusic = ->
    if themeId
      audioMedias.stop("theme")
      themeId = null
    if mapMusic?
      mm = mapMusic
      worldSongs.maps.stop mm
      mapMusic = null
    if gameMusic?
      worldSongs.games.stop gameMusic
      gameMusic = null
  playMusic = ->
    return if not isMusicOn or isPaused
    audioMedias.play("theme", options(10)) if themeId
    worldSongs.maps.play(mapMusic, options(10)) if mapMusic?
    worldSongs.games.play(gameMusic, options(1)) if gameMusic?
  switchMusic = (action) ->
    action = action || if isMusicOn then "play" else "pause"
    audioMedias.pause(fxName) if fxName
    audioMedias[action]("theme", options(10)) if themeId
    worldSongs.maps[action](mapMusic, options(10)) if mapMusic?
    worldSongs.games[action](gameMusic, options(1)) if gameMusic?

  pubsub.subscribe "playMapMusic", (worldIndex) ->
    stopMusic()
    mapMusic = worldNames[worldIndex]
    playMusic()
  pubsub.subscribe "playGameMusic", (worldIndex) ->
    stopMusic()
    gameMusic = worldNames[worldIndex]
    playMusic()
  pubsub.subscribe "playTheme", ->
    stopMusic()
    themeId = true
    playMusic()
  pubsub.subscribe "switchMusic", (isOn) ->
    return if isOn is isMusicOn
    isMusicOn = isOn
    switchMusic() unless isPaused
  pubsub.subscribe "pause", (isManual) ->
    if isManual and not isPaused
      isPaused = true
      switchMusic "pause"
  pubsub.subscribe "resume", (isManual) ->
    if isManual and isPaused
      isPaused = false
      switchMusic "play"

  pubsub.subscribe "switchSoundFx", (isOn) -> isFxOn = isOn
  pubsub.subscribe "playFx", (_fxName) ->
    return unless isFxOn
    audioMedias.stop(fxName) if fxName
    fxName = _fxName
    if audioNames.indexOf(fxName) > -1
      setTimeout (->
        audioMedias.stop fxName
        audioMedias.play fxName, options(1)
        mediaIds[fxName]-- if mediaIds[fxName] > 0
      ), mediaIds[fxName] * 60
      mediaIds[fxName]++ if mediaIds[fxName] < 23
    else
      console.error "Cannot play unknown sound fx: #{fxName}"
  pubsub.subscribe "stopFx", (fxName) -> 
    if audioNames.indexOf(fxName) > -1
      audioMedias.stop fxName
    else
      console.error "Cannot stop unknown sound fx: #{fxName}"

  0