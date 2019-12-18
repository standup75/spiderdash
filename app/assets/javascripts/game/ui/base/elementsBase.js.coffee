# displayable is anything drawn on the UI canvas (score, info...), default is a image
class swGame.displayable
  isActivated: false
  image: null
  # provides default behavior only if the displayable is an image
  # otherwise (ie. most cases), needs to be implemented
  draw: (image = @image) -> @ctx.drawImage(image, @x, @y) if image
  activate: ->
    @isActivated = true
    @draw()
  deactivate: ->
    @isActivated = false
    @clear()
  redraw: ->
    if @isActivated
      @clear()
      @draw()
  clear: ->
    @ctx.clearRect @x, @y, @width, @height
  constructor: (x, y, width, height) ->
    @ctx = swGame.globals.ctxUi
    if arguments.length > 0
      if @image
        @width = @image.width
        @height = @image.height
      else
        @width = width || 0
        @height = height || 0
      @x = @_findCoordinate x, @ctx.canvas.width - @width
      @y = @_findCoordinate y, @ctx.canvas.height - @height
    @
  _findCoordinate: (coordinate, end) ->
    return coordinate if not isNaN coordinate
    if coordinate.substr(-1, 1) == "%"
      Math.floor(end * parseFloat(coordinate, 10) / 100)
    else
      switch coordinate
        when "center" then return Math.round end / 2
        when "end" then return end

class swGame.clickable extends swGame.displayable
  currentTabIndex = null
  buttons = []
  isSelected = -> currentTabIndex isnt null and buttons[currentTabIndex] and buttons[currentTabIndex].isActivated
  selectNext = ->
    buttonCount = buttons.length
    return false unless buttonCount
    if isSelected()
      buttons[currentTabIndex].redraw()
      currentTabIndex = (currentTabIndex + 1) % buttonCount
    else
      currentTabIndex = 0
    count = 0
    while count++ < buttonCount and not buttons[currentTabIndex].isActivated
      currentTabIndex = (currentTabIndex + 1) % buttonCount
    return false if count > buttonCount
    buttons[currentTabIndex].selected()
    true

  pubsub.subscribe "select", ->
    if isSelected() or selectNext() 
      buttonToClick = buttons[currentTabIndex]
      currentTabIndex = null
      buttonToClick.redraw()
      buttonToClick.clicked()
  pubsub.subscribe "tab", selectNext

  buttonSelected: swGame.images.add "#{swGame.settings.assetsPath}/ui/button_selected.png"
  # abstract
  clicked: ->
  selected: ->
    @draw(@buttonSelected) if @buttonSelected

  constructor: ->
    buttons.push @
    super
  activate: ->
    pubsub.subscribe("touch", @touch) if not @isActivated
    super
  deactivate: ->
    pubsub.unsubscribe("touch", @touch) if @isActivated
    super
  touch: (x, y) =>
    @clicked() if x >= @x and y >= @y and x <= @x + @width and y <= @y + @height
