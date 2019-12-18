swGame.feedback = do ->
  submitEl = formEl = contentEl = syncModalEl = null
  open = ->
    pubsub.publish "requestKeyboard"
    syncModalEl.style.display = "none"
    formEl.style.display = "block"
    contentEl.focus()
  close = ->
    pubsub.publish "releaseKeyboard"
    formEl.style.display = "none"
    contentEl.value = ""
  send = ->
    swGame.helpers.ajax
      url: "/users/null/feedback.json"
      type: "POST"
      callback: (resp) -> swGame.notification.show "Thank you for your feedback!"
      params:
        content: contentEl.value
    close()
  init = ->
    submitEl = document.getElementById "feedback-submit"
    formEl = document.getElementById "feedback-form"
    contentEl = document.getElementById "feedback-content"
    syncModalEl = document.getElementById "sync-modal"
    document.getElementById("sync-button")?.addEventListener "mousedown", (-> formEl.style.display = "none")
    document.getElementById("feedback-close")?.addEventListener "mousedown", close
    document.getElementById("feedback-link")?.addEventListener "mousedown", open
    submitEl?.addEventListener "mousedown", send

  pubsub.subscribe "init", init
