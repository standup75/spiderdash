class swGame.FakePlayer extends swGame.Player
  dead: ->
    @isDying = false
  _fadeScoreOutOrIn: ->