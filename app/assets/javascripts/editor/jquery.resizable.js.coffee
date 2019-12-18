$.fn.resizable = (options) ->
  padding = (charCount) ->
    str = ""
    str = str + "." while (str.length < charCount)
    str
  @each ->
    $layout = $ @
    layoutSurface = 0
    blocked = false
    setLayoutSurface = ->
      layoutSurface = $("#tile_count_y").val()*$("#tile_count_x").val()
      $layout.attr "maxLength", layoutSurface
    setLayoutSurface()
    # resize textareas when size params change
    $("#tile_count_x").change ->
      $el = $ @
      rowCount = $("#tile_count_y").val()
      oldColCount = layoutSurface/rowCount
      newColCount = $el.val()
      content = $layout.val()
      newVal = ""
      pad = padding(Math.max 0, newColCount-oldColCount)
      rowLength = Math.min oldColCount, newColCount
      newVal = content.substr(rowCount*oldColCount, rowLength) + pad + newVal while rowCount--
      $layout.val newVal
      setLayoutSurface()
      $layout.attr "cols", newColCount
    $("#tile_count_y").change ->
      rowCount = $(@).val()
      charCount = $("#tile_count_x").val() * rowCount
      $layout.val $layout.val().substr(0, charCount)
      setLayoutSurface()
      $layout.attr "rows", rowCount
    # paste strings
    $layout.bind "paste", (e) ->
      @selectionEnd = @selectionStart
      $el = $ @
      $el.attr "maxLength", null
      setTimeout ->
        val = $el.val()
        pastedLength = Math.max 0, val.length-layoutSurface
        newCursorPosition = $el[0].selectionStart
        beforeCursor = val.substring(0,newCursorPosition)
        afterCursor = val.substring(newCursorPosition+pastedLength, val.length)
        newVal = beforeCursor + afterCursor
        $el.val newVal.substr(0, layoutSurface)
        $el.attr "maxLength", layoutSurface
        $el[0].selectionStart = newCursorPosition
      , 100
    # insert chars
    $layout.keyup (e) ->
      blocked = false
    $layout.keydown (e) ->
      switch e.keyCode
        when 13, 32, 45, 63, 8 then e.preventDefault()
        when 16, 17, 18, 37, 38, 39, 40 then
        when 91 then blocked = true
        else
          if not blocked
            @setSelectionRange @selectionStart, @selectionStart+1
    