swGame.soundWeb = ->
  "use strict"

  mapMusic = gameMusic = themeId = isMusicOn = isFxOn = null
  isPaused = false
  spriteFxTimeline =
    lose: [0, 1700],
    boom: [1700, 200],
    star1: [1900, 1500],
    star2: [3400, 1500],
    star3: [4900, 1500],
    web: [6400, 1000],
    win: [7400, 1400],
    mustache: [8800, 2000],
    secret: [10800, 2500],
    fall: [13300, 1600]
  themeSong = new Howl
    urls: ["#{swGame.settings.assetsPath}/theme.mp3", "#{swGame.settings.assetsPath}/theme.ogg"]
    loop: true
  spriteFx = new Howl
    urls: ["#{swGame.settings.assetsPath}/sprite.mp3", "#{swGame.settings.assetsPath}/sprite.ogg"],
    sprite: spriteFxTimeline
  loopFx =
    threading: new Howl
      urls: ["#{swGame.settings.assetsPath}/threading.mp3", "#{swGame.settings.assetsPath}/threading.ogg"]
      loop: true
  spriteFxIds = {}
  worldSongs = []
  for world in ["Main", "Woods", "Mountain", "Beach", "Cave", "Color-hills", "Flying-dutchman", "Hell"]
    worldSongs.push
      map: new Howl
        urls: ["#{swGame.settings.assetsPath}/#{world}-map.mp3", "#{swGame.settings.assetsPath}/#{world}-map.ogg"]
        loop: true
      game: new Howl
        urls: ["#{swGame.settings.assetsPath}/#{world}.mp3", "#{swGame.settings.assetsPath}/#{world}.ogg"]
  stopMusic = ->
    if themeId
      themeSong.stop()
      themeId = null
    if mapMusic?
      mm = mapMusic
      worldSongs[mm].map.fadeOut 0, 300, (-> worldSongs[mm].map.stop())
      mapMusic = null
    if gameMusic?
      worldSongs[gameMusic].game.stop()
      gameMusic = null
  playMusic = ->
    return if not isMusicOn or isPaused
    themeSong.fadeIn(1, 300) if themeId
    worldSongs[mapMusic].map.fadeIn(1, 300) if mapMusic?
    worldSongs[gameMusic].game.fadeIn(1, 300) if gameMusic?
  switchMusic = (action) ->
    action = action || if isMusicOn then "play" else "pause"
    themeSong[action]() if themeId
    worldSongs[mapMusic].map[action]() if mapMusic?
    worldSongs[gameMusic].game[action]() if gameMusic?


  pubsub.subscribe "playMapMusic", (worldIndex) ->
    stopMusic()
    mapMusic = worldIndex
    playMusic()
  pubsub.subscribe "playGameMusic", (worldIndex) ->
    stopMusic()
    gameMusic = worldIndex
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
      Howler.mute()
  pubsub.subscribe "resume", (isManual) ->
    if isManual and isPaused
      isPaused = false
      switchMusic()
      Howler.unmute()

  pubsub.subscribe "switchSoundFx", (isOn) -> isFxOn = isOn
  pubsub.subscribe "playFx", (fxName) ->
    return unless isFxOn
    if spriteFxTimeline[fxName]
      spriteFxIds[fxName] ||= 0
      setTimeout (->
        spriteFx.play fxName
        spriteFxIds[fxName]-- if spriteFxIds[fxName] > 0
      ), spriteFxIds[fxName] * 60
      spriteFxIds[fxName]++ if spriteFxIds[fxName] < 23
    else
      loopFx[fxName].stop()      
      loopFx[fxName].play()
  pubsub.subscribe "stopFx", (fxName) -> loopFx[fxName].stop()

  0