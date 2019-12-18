swGame.notification = do ->
  notifEl = null
  messageOpacity = speed = 0
  animNotif = ->
    if messageOpacity >= 1
      messageOpacity = 0
      notifEl.style.opacity = 0
      notifEl.style.display = "none"
      pubsub.unsubscribe "repaint", animNotif
    else if messageOpacity >= 0.4 and messageOpacity <= 0.6
      messageOpacity += 0.004 * speed
    else
      messageOpacity += 0.04 * speed
    notifEl.style.opacity = Math.sin(Math.PI*messageOpacity)

  init = =>
    notifEl = document.getElementById "notification"

  pubsub.subscribe "init", init

  show: (msg, _speed) ->
    notifEl.innerHTML = msg
    notifEl.style.display = "block"
    speed = _speed || 1
    if messageOpacity is 0
      pubsub.subscribe "repaint", animNotif
    else
      messageOpacity = 0

