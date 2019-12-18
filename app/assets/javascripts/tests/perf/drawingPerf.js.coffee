window.swPerfs ?= []

window.swPerfs.push
  name: "Clear the board"
  test: ->
    swGame.ui.clearBoard()

window.swPerfs.push
  name: "Monster repaint"
  setup: ->
    @monster = new swGame.Monster
  test: ->
    @monster.repaint()
  teardown: ->
    @monster.destroy()
    @monster = null

window.swPerfs.push
  name: "Ennemy repaint"
  setup: ->
    @ennemy = new swGame.Ennemy
  test: ->
    @ennemy.repaint()
  teardown: ->
    @ennemy.destroy()
    @ennemy = null

window.swPerfs.push
  name: "Centipede repaint"
  setup: ->
    @centipede = new swGame.Centipede
  test: ->
    @centipede.repaint()
  teardown: ->
    @centipede.destroy()
    @centipede = null

window.swPerfs.push
  name: "Player repaint"
  setup: ->
    @player = new swGame.Player
  test: ->
    @player.repaint()
  teardown: ->
    @player.destroy()
    @player = null

window.swPerfs.push
  name: "Fly repaint"
  setup: ->
    @fly = new swGame.Fly
  test: ->
    @fly.repaint()
  teardown: ->
    @fly.destroy()
    @fly = null


window.swPerfs.push
  name: "Player drawing repaint"
  loopCount: 0
  setup: ->
    @player = new swGame.Player
    @player.repaint()
    @player.turn swGame.Point.make(0,1)
    @player.repaint()
    @player.turn swGame.Point.make(1,0)
  test: ->
    @player.repaint()
    @player.turn swGame.Point.make(0,1) if @loopCount++ == 70
    @player.turn swGame.Point.make(-1,0) if @loopCount == 142
  teardown: ->
    @player.destroy()
    @player = null

window.swPerfs.push
  name: "Player drawing with fly repaint"
  loopCount: 0
  setup: ->
    @fly = new swGame.Fly
      factor: 0
      location: swGame.Point.make 5000, 5000
    @player = new swGame.Player
    @player.repaint()
    @player.turn swGame.Point.make(0,1)
    @player.repaint()
    @player.turn swGame.Point.make(1,0)
  test: ->
    @fly.repaint()
    @player.repaint()
    @player.turn swGame.Point.make(0,1) if @loopCount++ == 70
    @player.turn swGame.Point.make(-1,0) if @loopCount == 142
  teardown: ->
    @fly.destroy()
    @fly = null
    @player.destroy()
    @player = null

window.swPerfs.push
  name: "Player drawing with centipede repaint"
  loopCount: 0
  setup: ->
    @centipede = new swGame.Centipede
      factor: 0
      location: swGame.Point.make 5000, 5000
    @player = new swGame.Player
    @player.repaint()
    @player.turn swGame.Point.make(0,1)
    @player.repaint()
    @player.turn swGame.Point.make(1,0)
  test: ->
    @centipede.repaint()
    @player.repaint()
    @player.turn swGame.Point.make(0,1) if @loopCount++ == 70
    @player.turn swGame.Point.make(-1,0) if @loopCount == 142
  teardown: ->
    @centipede.destroy()
    @centipede = null
    @player.destroy()
    @player = null

window.swPerfs.push
  name: "Native isPointInPath"
  loopCount: 0
  setup: ->
    c=document.getElementById "canvas"
    @ctx=c.getContext "2d"
  test: ->
    @ctx.rect 20,20,150,100
    pip = @ctx.isPointInPath 20,50

window.swPerfs.push
  name: "swGame.Point.isInsidePath"
  loopCount: 0
  setup: ->
    @path = new swGame.Path [20,20],[150,20],[150,100],[20,100]
    @pt = swGame.Point.make 20,50
  test: ->
    pip = @pt.isInsidePath @path
  teardown: ->
    @pt.unmake()
