class swGame.Path extends swGame.AbstractPath
  "use strict"
  shadowMatrix =
    "100": {x: 0, y: 5}
    "010": {x: 1, y: 5}
    "101": {x: 2, y: 5}
    "011": {x: 3, y: 5}
    "001": {x: 4, y: 5}
    "111": {x: 5, y: 5}
  embossMatrix =
    "0000": {x: 5, y: 1}
    "0010": {x: 0, y: 0}
    "1010": {x: 0, y: 1}
    "1000": {x: 0, y: 2}
    "0100": {x: 1, y: 3}
    "0101": {x: 2, y: 3}
    "0001": {x: 3, y: 3}
    "0110":
      "0010": {x: 1, y: 0}
      "0000": {x: 4, y: 0}
    "1100":
      "0100": {x: 1, y: 2}
      "0000": {x: 4, y: 2}
    "0011":
      "0001": {x: 3, y: 0}
      "0000": {x: 6, y: 0}
    "1001":
      "1000": {x: 3, y: 2}
      "0000": {x: 6, y: 2}
    "1101":
      "1100": {x: 2, y: 2}
      "0000": {x: 5, y: 2}
      "0100": {x: 5, y: 4}
      "1000": {x: 6, y: 4}
    "1011":
      "1001": {x: 3, y: 1}
      "0000": {x: 6, y: 1}
      "0001": {x: 7, y: 4}
      "1000": {x: 5, y: 3}
    "1110":
      "0110": {x: 1, y: 1}
      "0000": {x: 4, y: 1}
      "0010": {x: 4, y: 4}
      "0100": {x: 6, y: 3}
    "0111":
      "0011": {x: 2, y: 0}
      "0000": {x: 5, y: 0}
      "0001": {x: 4, y: 3}
      "0010": {x: 7, y: 3}
    "1111":
      "1111": {x: 2, y: 1}
      "1010": {x: 2, y: 4}
      "0101": {x: 3, y: 4}
      "1101": {x: 7, y: 0}
      "1100": {x: 8, y: 0}
      "1110": {x: 9, y: 0}
      "1001": {x: 7, y: 1}
      "0000": {x: 8, y: 1}
      "0110": {x: 9, y: 1}
      "1011": {x: 7, y: 2}
      "0011": {x: 8, y: 2}
      "0111": {x: 9, y: 2}
      "1000": {x: 8, y: 3}
      "0100": {x: 9, y: 3}
      "0001": {x: 8, y: 4}
      "0010": {x: 9, y: 4}

  embossImage: swGame.images.add "#{swGame.settings.assetsPath}/tiles_emboss.png"

  constructor: ->
    super
    @ctx = swGame.globals.ctxBackground
    @canvas = swGame.globals.canvasBackground

  drawPath: ->
    super
    @drawPathSegment @path[@path.length - 1], @path[0]

  drawLevel: (level) ->
    @ctx.drawImage(level.picture, 0, 0) if level.picture
    @_drawTiles level
    @drawPath()

  getCopy: (index) ->
    if index >= 0
      @path[index].getCopy()
    else
      pathCopy = []
      pathCopy.push pt.getCopy() for pt in @path
      new swGame.Path pathCopy
        
  closePath: ->
    threadCount = Math.ceil @calculatePx2() / 9600
    res = false
    if threadCount
      @ctx.save()
      @_setContextStyle()
      @drawAndFillPath()
      @ctx.restore()
      swGame.spiderWeb.draw @
      res = true
    res
    
  drawAndFillPath: ->
    @ctx.beginPath()
    @drawPathInContext()
    @ctx.stroke()
    @ctx.fill()
    @ctx.clip()

  getCenterOfMass: ->
    twicearea = 0
    x = 0
    y = 0
    nPts = @path.length
    p1 = p2 = f = null
    i = 0
    j = nPts - 1
    while i < nPts
      p1 = @path[i]
      p2 = @path[j]
      twicearea += p1.x * p2.y
      twicearea -= p1.y * p2.x
      f = p1.x * p2.y - p2.x * p1.y
      x += (p1.x + p2.x) * f
      y += (p1.y + p2.y) * f
      j = i++
    f = twicearea * 3
    swGame.Point.make x / f, y / f  

  drawPathInContext: (ctx = @ctx) ->
    ctx.moveTo @path[0].x, @path[0].y
    index = 1
    while pt = @path[index]
      ctx.lineTo pt.x, pt.y
      index++

  _setContextStyle: ->
    @ctx.strokeStyle = "#fff"
    @ctx.shadowColor = 'rgba(0, 0, 0, 0.4)'
    @ctx.shadowOffsetX = -1
    @ctx.shadowOffsetY = 1
    @ctx.fillStyle = "hsla(0, 0%, 100%, 0.3)"

  _getEmbossCoordinates: (level, x, y) ->
    n = @_getTileFlag level, x, y - 1
    w = @_getTileFlag level, x + 1, y
    s = @_getTileFlag level, x, y + 1
    e = @_getTileFlag level, x - 1, y
    coordinate = embossMatrix["" + n + w + s + e]
    unless coordinate.x?
      ne = @_getCornerTileFlag level, n, e, x - 1, y - 1
      nw = @_getCornerTileFlag level, n, w, x + 1, y - 1
      sw = @_getCornerTileFlag level, s, w, x + 1, y + 1
      se = @_getCornerTileFlag level, s, e, x - 1, y + 1
      coordinate = coordinate["" + ne + nw + sw + se]
    coordinate

  _getCornerTileFlag: (level, dir1, dir2, x, y) ->
    return 0 if not (dir1 and dir2)
    @_getTileFlag level, x, y

  _getTileFlag: (level, x, y) ->
    return 0 if x < 0 or y < 0 or x > level.tileCountX + 1 or y > level.tileCountY + 1
    return 1 if x == 0 or y == 0 or x == level.tileCountX + 1 or y == level.tileCountY + 1 or level.tiles[x-1]?[y-1]?
    0

  _drawTiles: (level) ->
    x = level.tileCountX + 2
    while x--
      y = level.tileCountY + 2
      while y--
        if x == level.tileCountX + 1 or x == 0 or y == level.tileCountY + 1 or y == 0 or level.tiles[x - 1]?[y - 1]?
          @_drawATile level, x, y
        else
          @_drawShadow level, x, y
    null

  _drawATile: (level, x, y) ->
    if level.wallsPicture
      tileSize = level.wallsPicture.height
      tileIndex = Math.floor Math.random() * (level.wallsPicture.width / tileSize)
      @ctx.drawImage level.wallsPicture, tileIndex * tileSize, 0, tileSize, tileSize, x * tileSize, y * tileSize, tileSize, tileSize
      emboss = @_getEmbossCoordinates level, x, y
      @ctx.drawImage @embossImage, emboss.x * tileSize, emboss.y * tileSize, tileSize, tileSize, x * tileSize, y * tileSize, tileSize, tileSize

  _drawShadow: (level, x, y) ->
    if level.wallsPicture
      tileSize = level.wallsPicture.height
      shadow = shadowMatrix["" + @_getTileFlag(level, x, y - 1) + @_getTileFlag(level, x + 1, y) + @_getTileFlag(level, x + 1, y - 1)]
      if shadow
        @ctx.drawImage @embossImage, shadow.x * tileSize, shadow.y * tileSize, tileSize, tileSize, x * tileSize, y * tileSize, tileSize, tileSize
