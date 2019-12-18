swGame.sound = do ->
  "use strict"

  if swGame.device.mobile
  	swGame.soundPhonegap()
  else
  	swGame.soundWeb()