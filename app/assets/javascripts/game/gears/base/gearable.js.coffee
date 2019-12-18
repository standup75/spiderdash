swGame.gearable =
  _gearsEndtimes: null
  canWearGears: true
  setGearEndTime: (name, duration) ->
    @_gearsEndtimes[name] = (@getGearEndTime(name) or new Date().getTime()) + duration
  getGearEndTime: (name) ->
    @_gearsEndtimes ?= {}
    @_gearsEndtimes[name]
  deleteGearEndTime: (name) ->
    delete @_gearsEndtimes?[name]

