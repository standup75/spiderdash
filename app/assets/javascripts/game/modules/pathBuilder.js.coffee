class swGame.PathBuilder
  constructor: (level) ->
    @level = level

  makePath: (force_init) ->
    @path = null if force_init
    @path ||= @_build_path()
  
  _build_path: ->
    point_array = []
    shiftX = Math.floor @level.tileWidth
    shiftY = Math.floor @level.tileHeight
    for position in @_normalized_path()
      x = shiftX + position.x * @level.tileWidth
      y = shiftY + position.y * @level.tileHeight
      point_array.push swGame.Point.make(x, y)
    point_array
  
  _normalized_path: ->
    normalized_path = []
    if @level
      start_position = @_find_start()
      @direction = {x: 0, y: -1}
      loop
        last = if normalized_path.length>0 then normalized_path[normalized_path.length-1] else start_position
        normalized_path.push(@_find_next(last))
        break if @_last_element_is(start_position, normalized_path)
    normalized_path.pop()
    normalized_path
  
  _last_element_is: (position, point_array) ->
    pal = point_array.length
    pal>1 and point_array[pal-1].x == position.x and point_array[pal-1].y == position.y
  
  _find_start: ->
    for y in [0..@level.tileCountY-1]
      for x in [0..@level.tileCountX-1]
        return {x: x, y: y} if @_is_free(x, y)
  
  _find_next: (position) ->
    x = position.x
    y = position.y
    while @_is_free_ahead(x, y)
      x += @direction.x
      y += @direction.y
    @_update_direction x, y
    {x: x, y: y}
  
  _update_direction: (x, y) ->
    @direction = @_turn_clockwise()
    @direction = @_opposite() if not @_is_free_ahead(x, y)

  _is_free_ahead: (x, y) ->
    # there should be a tile and a free space around the segment
    # [[x, y], [x+@direction.x, y+@direction.y]]
    if @direction.y == -1
      @_is_free(x-1, y-1) ^ @_is_free(x, y-1)
    else if @direction.y == 1
      @_is_free(x-1, y) ^ @_is_free(x, y)
    else if @direction.x == 1
      @_is_free(x, y) ^ @_is_free(x, y-1)
    else if @direction.x == -1
      @_is_free(x-1, y) ^ @_is_free(x-1, y-1)

  _is_free: (x, y) ->
    return false if x<0 or y<0 or x==@level.tileCountX or y==@level.tileCountY
    not (@level.tiles and @level.tiles[x] and @level.tiles[x][y])
  
  _turn_clockwise: ->
    if @direction.y == -1
      {x: 1, y: 0}
    else if @direction.y == 1
      {x: -1, y: 0}
    else if @direction.x == 1
      {x: 0, y: 1}
    else if @direction.x == -1
      {x: 0, y: -1}
  
  _opposite: ->
    {x: -@direction.x, y: -@direction.y}
