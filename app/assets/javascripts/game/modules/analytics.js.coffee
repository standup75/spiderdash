swGame.analytics = do ->
  startDate = +(new Date)

  encodedGameProgress = (gp) -> encodeURIComponent(JSON.stringify(gp))

  s4 = -> Math.floor((1 + Math.random()) * 0x10000).toString(16).substring 1

  get_or_generate_uuid = ->
    localStorage.uuid ||= s4() + s4() + "-" + s4() + "-" + s4() + "-" + s4() + "-" + s4() + s4() + s4()

  pubsub.subscribe "levelReady", -> startDate = +(new Date)

  pubsub.subscribe "levelCompleted", (worldIndex, checkpointIndex) ->
    gameProgress = swGame.profile.getGameProgress()
    swGame.helpers.ajax
      url: "/users/#{localStorage.userId || "null"}/game_data.json"
      type: "POST"
      params:
        level_id: swGame.gameData.worlds[worldIndex].checkpoints[checkpointIndex].level.id
        star_count: gameProgress.stars[worldIndex][checkpointIndex]
        time: +(new Date) - startDate
        game_progress: encodedGameProgress gameProgress
        uuid: get_or_generate_uuid()
        status: 1

  pubsub.subscribe "gameOver", ->
    gameProgress = swGame.profile.getGameProgress()
    swGame.helpers.ajax
      url: "/users/#{localStorage.userId || "null"}/game_data.json"
      type: "POST"
      params:
        level_id: swGame.level.getCurrentCheckpoint().level.id
        star_count: 0
        time: +(new Date) - startDate
        game_progress: encodedGameProgress gameProgress
        uuid: get_or_generate_uuid()
        status: 0

  uuid: get_or_generate_uuid