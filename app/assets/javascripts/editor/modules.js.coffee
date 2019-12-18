#= require lib/theBeast
theBeast.add
  worldCanvas: ->
    instance: ->
      $this = $ @
      canvas = $this.find(".canvas")[0]
      world_id = @dataset.world_id
      bgctx = $this.find(".bgcanvas")[0].getContext "2d"
      ctx = canvas.getContext "2d"
      ctx.lineCap = "square"
      canvasWidth = canvas.width
      ratio = $(canvas).width() / canvasWidth
      canvasHeight = canvas.height
      canvasOffsetTop = $this.find(".canvas-container").offset().top
      canvasOffsetLeft = $this.find(".canvas-container").offset().left
      $gridHeight = $("#world_grid_height")
      $gridWidth = $("#world_grid_width")
      $worldName = $("#world_name")
      $updateCp = $this.find(".update_checkpoint")
      $bump = $this.find(".bump")
      $delete = $this.find(".delete")
      $body = $ 'body'
      $checkpointDetails = $this.find ".checkpoint-details"
      canvasWidthStep = canvasHeightStep = 0
      selectedIndex = null
      colors = ["#ccf8fc", "#fbfccc", "#fcefcc", "#faccfc", "#d7fccc", "#ccfcf5", "#fff"]
      drawgrid = ->
        resetGrid()
        drawLines()
        drawCheckpoints()
        $checkpointDetails.hide()
      resetGrid = ->
        ctx.strokeStyle = "aaeeee"
        ctx.clearRect 0, 0, canvasWidth, canvasHeight
       drawLines = ->
        gridWidth = $gridWidth.val()
        gridHeight = $gridHeight.val()
        canvasWidthStep = canvasWidth / gridWidth
        canvasHeightStep = canvasHeight / gridHeight
        drawVLines gridWidth, canvasWidthStep
        drawHLines gridHeight, canvasHeightStep
      drawCheckpoints = ->
        drawCheckpoint(cp, i) for cp, i in swGame.checkpoints
      drawBackdrop = ->
        if $worldName.val()
          url = "#{swGame.settings.assetsPath}/worlds/#{$worldName.val().toLowerCase().replace(/\s/g, "-")}/map.png"
          img = new Image
          img.onload = ->
            bgctx.drawImage img, 0, 0
          img.src = url
      drawHLines = (lineCount, step) ->
        while lineCount-->1
          ctx.beginPath();
          ctx.moveTo 0, lineCount*step
          ctx.lineTo canvasWidth, lineCount*step
          ctx.closePath()
          ctx.stroke()
      drawVLines = (lineCount, step) ->
        while lineCount-->1
          ctx.beginPath();
          ctx.moveTo lineCount*step, 0
          ctx.lineTo lineCount*step, canvasHeight
          ctx.closePath()
          ctx.stroke()
      drawCheckpoint = (cp, index) ->
        x = cp.x * canvasWidthStep
        y = cp.y * canvasHeightStep
        ctx.fillStyle = colors[if (cp.kind is 0 and not cp.levelId) or not cp.kind? then 6 else cp.kind]
        ctx.fillRect x, y, canvasWidthStep, canvasHeightStep
        ctx.fillStyle = "#333"
        ctx.font = "bold 15px Courier"
        ctx.fillText index, x+4, y+12
        circleCheckpoint "666666", cp
      circleCheckpoint = (color, cp) ->
        ctx.save()
        ctx.lineWidth = 3
        ctx.strokeStyle = color
        ctx.strokeRect cp.x * canvasWidthStep - 2, cp.y * canvasHeightStep - 2, canvasWidthStep + 4, canvasHeightStep + 4
        ctx.restore()
      moveCheckpoint = (x, y) ->
        selectedCp = getCp selectedIndex
        selectedCp.x = x
        selectedCp.y = y
        drawgrid()
        selectedIndex = null
      createCheckpoint = (x, y) ->
        swGame.checkpoints.push {x:x, y:y, index:swGame.checkpoints.length}
        drawgrid()
      onClick = (e) ->
        e.preventDefault()
        e.stopPropagation()
        mapAction e.clientX, e.clientY
      mapAction = (clientX, clientY) ->
        x = Math.floor (clientX - canvasOffsetLeft) / (canvasWidthStep * ratio)
        y = Math.floor (clientY - canvasOffsetTop + window.pageYOffset) / (canvasHeightStep * ratio)
        x = Math.min $gridWidth.val() - 1, x
        y = Math.min $gridHeight.val() - 1, y
        createMoveOrEdit(x, y)
      createMoveOrEdit = (x, y) ->
        cpIndex = findCheckpoint(x, y)
        if cpIndex>=0
          if selectedIndex is null
            selectCp(cpIndex)
          else
            insertSelectedAt(cpIndex)
            selectedIndex = null
        else
          if selectedIndex is null
            createCheckpoint x, y
          else
            moveCheckpoint x, y
          selectedIndex = null
      findCheckpoint = (x, y) ->
        for cp,i in swGame.checkpoints
          return i if cp.x is x and cp.y is y
        -1
      insertSelectedAt = (cpIndex) ->
        if selectedIndex isnt cpIndex
          cp = getCp selectedIndex
          deleteSelected()
          swGame.checkpoints.splice(cpIndex, 0, cp)
        drawgrid()
      deleteSelected = ->
        swGame.checkpoints.splice(selectedIndex, 1)
        selectedIndex = null
      showCheckpointDetails = (cpIndex) ->
        cp = getCp cpIndex
        $checkpointDetails.find("[name='x']").val cp.x
        $checkpointDetails.find("[name='y']").val cp.y
        $checkpointDetails.find("[name='kind']").val cp.kind
        if cp.levelId
          $checkpointDetails.find("#checkpoint_level_id").val(cp.levelId)
        if cp.linkToWorldId
          $checkpointDetails.find("#checkpoint_link_to_world_id").val cp.linkToWorldId
        $checkpointDetails.show()
        $updateCp.parent().data("index", cpIndex)
      selectCp = (index)->
        selectedIndex = index
        drawgrid()
        ctx.save()
        circleCheckpoint "ffffff", getCp(selectedIndex)
        showCheckpointDetails index
      selectNextCp = (index) ->
        index = 0 if index >= swGame.checkpoints.length
        selectCp index
      selectPreviousCp = (index) ->
        index = swGame.checkpoints.length-1 if index < 0
        selectCp index
      getCp = (index) -> swGame.checkpoints[index]

      $gridHeight.change -> drawgrid()
      $gridWidth.change -> drawgrid()
      $worldName.change -> drawgrid()
      canvas.addEventListener "click", onClick
      $("form.edit_world").submit ->
        $("#checkpoints_json").val JSON.stringify(swGame.checkpoints || {})
      $updateCp.click ->
        $this = $ @
        index = $this.parent().data("index")
        cp = getCp index
        cp.x = parseInt $checkpointDetails.find("[name='x']").val(), 10
        cp.y = parseInt $checkpointDetails.find("[name='y']").val(), 10
        cp.kind = parseInt $checkpointDetails.find("[name='kind'] option:selected").val(), 10
        cp.levelId = parseInt $checkpointDetails.find("#checkpoint_level_id option:selected").val(), 10
        cp.linkToWorldId = parseInt $checkpointDetails.find("#checkpoint_link_to_world_id option:selected").val(), 10
        selectedIndex = null
        if $this.hasClass("next")
          selectNextCp(index+1)
        else if $this.hasClass("prev")
          selectPreviousCp(index-1)
        else
          drawgrid()
      $bump.click ->
        index = $(@).parent().data("index")
        cp = getCp index
        levelId = cp.levelId
        cp.levelId = null
        while cp = getCp ++index
          if cp.kind is 0 # CHECKPOINT_LEVEL
            tmpLevelId = cp.levelId
            cp.levelId = levelId
            levelId = tmpLevelId
        selectedIndex = null
        drawgrid()
      $delete.click ->
        deleteSelected()
        drawgrid()

      drawBackdrop()
      drawgrid()

  layout: ->
    $layout = $("#level_layout")
    $layout.resizable()
  disableCanvas: ->
    document.getElementById("full-canvas").style.display = "none"
    document.getElementById("canvas-ui").style.display = "none"
    setTimeout (-> pubsub.publish "togglePause"), 500
  clearLevel: ->
    instance: ->
      $(@).click (e) ->
        e.preventDefault()
        if confirm "Do you really want to clear this level?"
          $("#level_layout").val $("#level_layout").val().replace(/./g,  ".")
  createFakePlayer: ->
    fakePlayer = null
    speed = swGame.gameData.worlds[0].checkpoints[0].level.speed
    instance: ->
      $(@).click ->
        if fakePlayer
          fakePlayer = fakePlayer.unmake()
          $(@).val("remove player")
        else
          fakePlayer = swGame.FakePlayer.make { level_speed: speed }
          $(@).val("add player")
  levelByWorldSelector: ->
    $levels = $ ".item-list"
    $worldLabels = $ ".world-selector li"
    instance: ->
      $(@).find("li").click ->
        $world = $ @
        isActivated = $world.hasClass "activated"
        $worldLabels.removeClass "activated"
        $levels.find("[data-world]").show()
        unless isActivated
          $world.addClass "activated"
          $levels.find("li:not([data-world=#{$world.data('world')}])").fadeOut()
  spriteOptions: ->
    getHtml = (index) ->
          """
           <div class="option">
             <input class="label" type="text" name="label_#{index}"/>
             <input class="content" type="text" name="content_#{index}"/>
             <div class="delete">x</div>
           </div>
           """
    instance: ->
      $this = $ @
      $this.find(".add-option").click (e) ->
        e.preventDefault()
        $this.append getHtml($this.find(".content").length)
      $this.on "click", ".delete", (e) ->
        e.preventDefault()
        $option = $(@).closest ".option"
        $option.nextAll().each ->
          $label = $(@).find(".label")
          index = +($label.attr("name").split("_")[1])-1
          $label.attr "name", "label_#{index}"
          $(@).find(".content").attr "name", "content_#{index}"
        $option.remove()
  levelOptions: ->
    $template = $ "#level-option-template"
    createOption = (index) -> $template.text().replace(/\{\{i\}\}/g, index)
    instance: ->
      $this = $ @
      $this.find(".add-option").click (e) ->
        e.preventDefault()
        $this.append createOption($this.find(".content").length)
      $this.on "click", ".delete", (e) ->
        e.preventDefault()
        $option = $(@).closest ".option"
        $option.nextAll().each ->
          $label = $(@).find(".label")
          index = +($label.attr("name").split("_")[1])-1
          $label.attr "name", "label_#{index}"
          $(@).find(".content").attr "name", "content_#{index}"
          $(@).find(".sprite").attr "name", "sprite_#{index}"
        $option.remove()
