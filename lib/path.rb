class Path
  def initialize(level_sprite)
    #@logger = Logger.new(STDOUT)
    @sprite = level_sprite.sprite
    @level = level_sprite.level
    @width = @level.world.game.width
    @height = @level.world.game.height
    @tile_width = (@width.to_f / (@level.tile_count_x + 2)).ceil
    @tile_height = (@height.to_f / (@level.tile_count_y + 2)).ceil
    @start_position = {:x => level_sprite.x, :y => level_sprite.y}
  end
  
  def build(force_init = false)
    @path = nil if force_init
    @path ||= build_path
  end
  
  private
  
  def build_path
    point_array = []
    normalized_path.each do |position|
      point_array << {:x => (position[:x] + 1) * @tile_width, :y => (position[:y] + 1) * @tile_height}
    end
    point_array
  end
  
  def normalized_path
    normalized_path = []
    if @level
      @direction = {:x => 0, :y => -1}
      until last_element_is?(@start_position, normalized_path) do
        normalized_path << find_next(normalized_path.last || @start_position)
        #@logger.info "-------------"
        #@logger.info normalized_path
      end
    end
    normalized_path.pop
    normalized_path
  end
  
  def last_element_is?(position, point_array)
    point_array.size>1 and point_array.last[:x] == position[:x] and point_array.last[:y] == position[:y]
  end

  def find_next(position)
    x = position[:x]
    y = position[:y]
    while is_free_ahead x, y, position
      x += @direction[:x]
      y += @direction[:y]
    end
    update_direction x, y
    {x: x, y: y}
  end

  def update_direction(x, y)
    @direction = turn_clockwise
    @direction = {x: -@direction[:x], y: -@direction[:y]} unless is_free_ahead(x, y)
  end
  
  def is_free_ahead(x, y, position = {})
    if not (position[:x] == x and position[:y] == y)\
    and @start_position[:x] == x and @start_position[:y] == y
      return false
    end
    # there should be a tile and a free space around the segment
    # [[x, y], [x+@direction[:x], y+@direction[:y]]]
    if @direction[:y] == -1
      is_free?(x-1, y-1) ^ is_free?(x, y-1)
    elsif @direction[:y] == 1
      is_free?(x-1, y) ^ is_free?(x, y)
    elsif @direction[:x] == 1
      is_free?(x, y) ^ is_free?(x, y-1)
    elsif @direction[:x] == -1
      is_free?(x-1, y) ^ is_free?(x-1, y-1)
    end
  end
  
  def is_free?(x, y)
    ls = @level.level_sprites.where(:x => x, :y => y)
    ls.blank? or ls.first.sprite.helping_sprite_id != @sprite.id
  end
  
  def turn_clockwise
    if @direction[:y] == -1
      {x: 1, y: 0}
    elsif @direction[:y] == 1
      {x: -1, y: 0}
    elsif @direction[:x] == 1
      {x: 0, y: 1}
    elsif @direction[:x] == -1
      {x: 0, y: -1}
    end
  end
end
