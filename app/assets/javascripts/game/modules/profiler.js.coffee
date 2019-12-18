swGame.profiler = do ->
  debug = false
  count = 0
  profiles = {}
  start: (name) ->
    if debug
      profiles[name] = [] if not profiles[name]
      profile =
        startTime: +new Date
        stop: -> this.stopTime = +new Date
      profiles[name].push profile
      profile
  show: ->
    for profileName of profiles
      console.log "------------------ #{profileName} ------------------"
      profile = profiles[profileName]
      totalTime = 0
      totalTime += iteration.stopTime - iteration.startTime for iteration in profile when iteration.stopTime
      console.log "Total time: #{totalTime}ms"
      console.log "Number of iterations: #{profile.length}"
      console.log "Average time: #{Math.round((10*totalTime)/profile.length)/10}ms"
    null

