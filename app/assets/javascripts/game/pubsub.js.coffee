window.pubsub = do ->
  "use strict"
  cache = {}
  publish = (topic) ->
    event = cache[topic]
    if event and event.length>0
      callbackCount = event.length
      while callbackCount--
        if event[callbackCount]
          res = event[callbackCount].apply {}, Array.prototype.slice.call(arguments, 1)
      # some pubsub enhancement: we can get notified when everything
      # has been published by registering to topic+"_done"
      publish topic+"_done"
      # another pubsub enhancement, make it move from observer pattern
      # to some kind of startegy (used for redStars) where a subscriber can
      # return a value to the publisher (an array of value could be used in case we
      # we need several return values, but it is optimized here with one value only)
      res
  # check if a subscriber returns true
  findOrIgnore = (topic) ->
    event = cache[topic]
    if event and event.length>0
      callbackCount = event.length
      while callbackCount--
        if event[callbackCount]
          return true if event[callbackCount].apply {}, Array.prototype.slice.call(arguments, 1)
    false

  subscribe = (topic, callback) ->
    cache[topic] = [] unless cache[topic]
    cache[topic].push callback
    [ topic, callback ]
  unsubscribe = (topic, callback) ->
    if cache[topic]
      callbackCount = cache[topic].length
      while callbackCount--
        if cache[topic][callbackCount] is callback
          cache[topic].splice callbackCount, 1
  isSubscribed = (topic, callback) ->
    res = false
    if cache[topic]
      callbackCount = cache[topic].length
      while callbackCount--
        if cache[topic][callbackCount] is callback
          res = true
    res
  getSubscriptions = (topic) ->
    if topic
      cache[topic]
    else
      cache

  # see Cached Functions in the Module Pattern at 
  # http://coding.smashingmagazine.com/2012/11/05/writing-fast-memory-efficient-javascript
  publish: publish
  subscribe: subscribe
  unsubscribe: unsubscribe
  isSubscribed: isSubscribed
  getSubscriptions: getSubscriptions
  findOrIgnore: findOrIgnore
