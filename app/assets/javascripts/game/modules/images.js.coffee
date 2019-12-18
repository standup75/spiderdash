swGame.images = do ->
  sources = []
  count = 0
  totalCount = 0
  #tmp = {}
  getProgressPercent = ->
    100 - Math.round (count * 100) / totalCount
  loaded = ->
    swGame.images.ready = true
    pubsub.publish "imagesLoaded"
  load = ->
    totalCount = count
    loaded() if count is 0
    #setTimeout ->
    #  console.log tmp
    #, 1000
    for source in sources
      image = new Image
      image.onload = ->
        count--
        #tmp[this.src] = true
        loaded() if count is 0
        pubsub.publish "imagesLoadedProgress", getProgressPercent()
      image.onerror = -> count--
      image.src = source

  pubsub.subscribe "init_done", load

  add: (source) ->
    @ready = false
    sources.push source
    count++
    #tmp["http://localhost:3000" + source] = false
    image = new Image
    image.src = source
    image
  preloadGameDataImages: ->
    imageCache = []
    getImageFromCache = (path) ->
      for image in imageCache
        return image if image.src.indexOf(path) >= 0
      null
    createImage = (path) ->
      image = getImageFromCache path
      if not image
        image = swGame.images.add path
        imageCache.push image
      image
    if swGame.gameData
      for world in swGame.gameData.worlds
        if world.slug
          world.mapPicture = createImage("#{swGame.settings.assetsPath}/worlds/#{world.slug}/map.png")
          world.iconPicture = createImage("#{swGame.settings.assetsPath}/worlds/#{world.slug}/icon.png") unless world.slug is "main"
          for cp in world.checkpoints
            if cp.level
              cp.level.picture = createImage("#{swGame.settings.assetsPath}/worlds/#{world.slug}/background.png")
              cp.level.wallsPicture = createImage("#{swGame.settings.assetsPath}/worlds/#{world.slug}/walls.png")
    null
  ready: false
