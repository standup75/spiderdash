swGame.syncForm = do ->
  syncButtonEl = deleteEl = emailInputEl = passwordInputEl = playEl = null
  formEl = emailEl = statusEl = closeEl = modalEl = submitEl = resync = null
  showSyncButton = ->
    syncButtonEl.style.display = "block"
  hideSyncButton = ->
    syncButtonEl.style.display = "none"
  showSyncModal = ->
    pubsub.publish "requestKeyboard"
    pubsub.subscribe "esc", hideSyncModal
    hideSyncButton()
    modalEl.style.display = "block"
    gp = swGame.profile.getGameProgress()
    if gp and gp.email
      statusEl.style.display = "block"
      formEl.style.display = "none"
      emailEl.innerHTML = gp.email
    else
      statusEl.style.display = "none"
      formEl.style.display = "block"
  hideSyncModal = ->
    pubsub.publish "releaseKeyboard"
    pubsub.unsubscribe "esc", hideSyncModal
    showSyncButton()
    modalEl.style.display = "none"
    emailInputEl.value = ""
    passwordInputEl.value = ""
    submitEl.className = "css_sprite-submit"
  submitForm = ->
    if formIsValid()
      submitEl.className = "css_sprite-submitting"
      gp = swGame.profile.getGameProgress()
      gp.email = emailInputEl.value
      swGame.helpers.ajax
        url: "/sessions.json"
        type: "POST"
        callback: (resp) ->
          submitEl.className = "css_sprite-submit"
          resp = JSON.parse resp
          if resp.error
            swGame.notification.show resp.error
          else
            updateGameProgressAndReset(resp.user, resp.status)
        params:
          email: emailInputEl.value
          password: passwordInputEl.value
          gameProgress: encodeURIComponent(JSON.stringify(gp))
    false
  resync = ->
    if localStorage.userId
      swGame.helpers.ajax
        url: "/users/#{localStorage.userId}/sync_game_progress.json"
        type: "GET"
        callback: (resp) -> updateGameProgressAndReset(JSON.parse(resp), "Profile sync'd")
    else
      swGame.notification.show "Could not find your user id"
  updateGameProgress = (user) ->
    localStorage.gameProgress = user.gameProgress
    localStorage.userId = user.id
    swGame.profile.restoreGameProgress()
    gp = swGame.profile.getGameProgress()
    gp.email = user.email
  updateGameProgressAndReset = (user, status) ->
    updateGameProgress user
    hideSyncModal()
    swGame.notification.show status
    swGame.level.showSplashLevel()

  formIsValid = ->
    if passwordInputEl.value.length>0 and passwordInputEl.value.length<4
      swGame.notification.show "Password should be at least 4 characters"
    else
      return true
    false
  deleteProfile = ->
    localStorage.gameProgress = ""
    swGame.profile.restoreGameProgress()
    hideSyncModal()
    swGame.notification.show "Logged out"
    swGame.level.showSplashLevel()
    swGame.helpers.ajax
      url: "/sessions/delete.json"
      type: "POST"
  init = ->
    # play button
    playEl = document.getElementById "play"

    # modal
    syncButtonEl = document.getElementById("sync-button")
    modalEl = document.getElementById("sync-modal")
    closeEl = document.getElementById("sync-close")

    # status
    statusEl = document.getElementById("sync-status")
    emailEl = document.getElementById("sync-email")
    deleteEl = document.getElementById("sync-delete")
    resyncEl = document.getElementById("sync-resync")

    # form
    formEl = document.getElementById("sync-form")
    emailInputEl = document.getElementById("sync-email-input")
    passwordInputEl = document.getElementById("sync-password-input")
    submitEl = document.getElementById("sync-submit")

    syncButtonEl.addEventListener "mousedown", showSyncModal
    formEl.onsubmit = submitForm
    deleteEl.addEventListener "mousedown", deleteProfile
    resyncEl.addEventListener "mousedown", resync
    closeEl.addEventListener "mousedown", hideSyncModal

  pubsub.subscribe "init_done", init
  pubsub.subscribe "imagesLoaded", showSyncButton
  pubsub.subscribe "play", hideSyncButton
  pubsub.subscribe "showHome", showSyncButton
  pubsub.subscribe "editorMode", ->
    pubsub.unsubscribe "imagesLoaded", showSyncButton
    pubsub.unsubscribe "init_done", init
