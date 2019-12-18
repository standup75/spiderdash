swGame.secretGoals = do ->
  goalIsReached = ->
    pubsub.publish "playFx", "secret"
    swGame.profile.unlockBonusLevel()
    swGame.ui.showBonusLevelUnlocked()
    pubsub.publish "freeze"
    setTimeout ->
      pubsub.publish "displayWorldMap"
    , 2000
  showIntro = -> swGame.ui.showSecretGoalIntro()
  [
    ->
      goalMaybeReached = (sprite) ->
        goalIsReached() if sprite.name == "Centipede"
      deactivate = ->
        pubsub.unsubscribe "killSprites", deactivate
        pubsub.unsubscribe "someoneJustDied", goalMaybeReached

      showIntro()
      pubsub.subscribe "killSprites", deactivate
      pubsub.subscribe "someoneJustDied", goalMaybeReached
  ,
    ->
      goalMaybeDead = (sprite) ->
        #console.log("goal is dead") if sprite.name == "Ladybug"
        deactivate() if sprite.name == "Ladybug"
      deactivate = ->
        pubsub.unsubscribe "killSprites", deactivate
        pubsub.unsubscribe "someoneJustDied", goalMaybeDead
        pubsub.unsubscribe "levelCompleted", goalIsReached
      showIntro()
      pubsub.subscribe "killSprites", deactivate
      pubsub.subscribe "someoneJustDied", goalMaybeDead
      pubsub.subscribe "levelCompleted", goalIsReached
  ,
    ->
      goalMaybeReached = (sprite) ->
        remainingCentipede-- if sprite.name == "BabyCentipede"
        goalIsReached() unless remainingCentipede
      deactivate = ->
        pubsub.unsubscribe "killSprites", deactivate
        pubsub.unsubscribe "someoneJustDied", goalMaybeReached

      remainingCentipede = 6
      showIntro()
      pubsub.subscribe "killSprites", deactivate
      pubsub.subscribe "someoneJustDied", goalMaybeReached
  ,
    ->
      goalMaybeDead = (sprite) ->
        deactivate() if sprite.name == "Nest"
      deactivate = ->
        pubsub.unsubscribe "killSprites", deactivate
        pubsub.unsubscribe "someoneJustDied", goalMaybeDead
        pubsub.unsubscribe "levelCompleted", goalIsReached
      showIntro()
      pubsub.subscribe "killSprites", deactivate
      pubsub.subscribe "someoneJustDied", goalMaybeDead
      pubsub.subscribe "levelCompleted", goalIsReached
  ,
    ->
      goalMaybeReached = (sprite) ->
        goalIsReached() if swGame.level.getEnemyCount() == swGame.level.getKillCount()
      deactivate = ->
        pubsub.unsubscribe "killSprites", deactivate
        pubsub.unsubscribe "levelCompleted", goalMaybeReached
      showIntro()
      pubsub.subscribe "killSprites", deactivate
      pubsub.subscribe "levelCompleted", goalMaybeReached
  ,
    ->
      goalMaybeReached = (sprite) ->
        goalIsReached() if swGame.level.getEnemyCount() == swGame.level.getKillCount()
      deactivate = ->
        pubsub.unsubscribe "killSprites", deactivate
        pubsub.unsubscribe "levelCompleted", goalMaybeReached
      showIntro()
      pubsub.subscribe "killSprites", deactivate
      pubsub.subscribe "levelCompleted", goalMaybeReached
  ,
    ->
      deathKilledCount = 0
      goalMaybeReached = (sprite) ->
        deathKilledCount++ if sprite.name is "Death"
        goalIsReached() if deathKilledCount is 3
      deactivate = ->
        pubsub.unsubscribe "killSprites", deactivate
        pubsub.unsubscribe "levelCompleted", goalMaybeReached
      showIntro()
      pubsub.subscribe "killSprites", deactivate
      pubsub.subscribe "someoneJustDied", goalMaybeDead
  ]
