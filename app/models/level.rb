class Level < ActiveRecord::Base
  TILE_LETTER = "W"
  extend FriendlyId
  include Duplicatable
  friendly_id :name, use: :slugged
  attr_accessible :name, :world, :world_id, :tile_count_y, :tile_count_x, :set, :layout, :level_index, :speed
  validates_presence_of :name, :tile_count_y, :tile_count_x, :set, :speed
  has_many :level_bonus, :dependent => :destroy
  has_many :bonus, :through => :level_bonus
  has_many :level_sprites, :dependent => :destroy
  has_many :sprites, :through => :level_sprites
  has_many :level_tiles, :dependent => :destroy
  has_many :tiles, :through => :level_tiles
  has_many :options
  has_one :checkpoint
  after_save :save_layout
  belongs_to :world
  default_scope -> { order("level_index ASC") }

  def self.reset_world(world_id)
    where(:world_id => world_id).each do |level|
      level.update_attribute :level_index, nil
    end
  end

  def as_json(opts = {})
    {
      :name => name,
      :sprites => level_sprites.as_json(:level_id => id).compact,
      :bonus => level_bonus.as_json,
      :tiles => tiles_as_json,
      :index => level_index,
      :tileCountX => tile_count_x,
      :tileCountY => tile_count_y,
      :speed => speed,
      :id => id
    }
  end

  def tiles_as_json
    json_tiles = {}
    self.level_tiles.each do |lt|
      json_tiles[lt.x] ||= {}
      json_tiles[lt.x][lt.y] = TILE_LETTER
    end
    json_tiles
  end

  def layout
    layout = init_layout
    add_tiles layout
    add_sprites layout, "bonu", reverse_sprites_assoc["Bonu"]
    add_sprites layout, "sprite", reverse_sprites_assoc["Sprite"]
    layout
  end
  
  def layout=(layout)
    @layout = layout
  end
  
  def long_name
    if level_index
      "#{level_index}: #{name}"
    else
      name
    end
  end
  
  def surface
    self.tile_count_x*self.tile_count_y
  end
  
  def sprites_assoc
    if not @sprites_assoc
      @sprites_assoc = associate_letters Sprite.set(self.set)
      @sprites_assoc = associate_letters Bonu.set(self.set), @sprites_assoc
    end
    @sprites_assoc
  end

  protected
  
  def duplicate_children(new_level)
    self.level_bonus.each do |lb|
      lb.duplicate new_level
    end
    self.level_sprites.each do |ls|
      ls.duplicate new_level
    end
    self.level_tiles.each do |lt|
      lt.duplicate new_level
    end
  end

  def save_layout
    if @layout
      self.level_tiles.delete_all
      self.level_sprites.delete_all
      self.level_bonus.delete_all
      create_level_elements @layout
    end
  end

  def create_level_elements(layout)
    x = 0
    y = 0
    if layout
      layout.chars.each do |char|
        if char.ord != 10 and char.ord != 13
          if (char.upcase == TILE_LETTER or le = sprites_assoc[char]) and y<self.tile_count_y
            if char.upcase == TILE_LETTER
              le_classname = "Tile"
            else
              le_classname = le.class.name
            end
            cl = "Level#{le_classname}".constantize
            le_rel = cl.new({
              :level_id => self.id,
              :x => x,
              :y => y})
            le_rel.send("#{le_classname.downcase}_id=", le.id) if le_classname != "Tile"
            le_rel.save()
          end
          if x == self.tile_count_x-1
            x = 0
            y += 1
          else
            x += 1
          end
        end
      end
    end
  end
  
  def init_layout
    "."*self.surface
  end
  
  def reverse_sprites_assoc
    @reverse_sprites_assoc ||= reverse sprites_assoc
  end
  
  def reverse(assoc)
    reverse = {}
    assoc.keys.each do |key|
      classname = assoc[key].class.name
      reverse[classname] ||= {}
      reverse[classname][assoc[key].id] = key
    end
    reverse
  end
  
  def add_tiles(layout)
    self.level_tiles.each do |tile|
      if layout[tile.x+self.tile_count_x*tile.y]
        layout[tile.x+self.tile_count_x*tile.y] = TILE_LETTER
      end
    end
  end
  
  def add_sprites(layout, level_element_name, reverse_assoc)
    self.send("level_#{level_element_name}s").each do |level_element_rel|
      if layout[level_element_rel.x+self.tile_count_x*level_element_rel.y]
        layout[level_element_rel.x+self.tile_count_x*level_element_rel.y] = reverse_assoc[level_element_rel.send("#{level_element_name}_id")]
      end
    end
  end
  
  def associate_letters(level_elements, assoc_obj = {})
    level_elements.each do |le|
      letter = le.name[0].upcase
      isUpcase = true
      while assoc_obj[letter] do
        letter = isUpcase ? letter.upcase : letter.downcase
        if isUpcase
          ascii_code = letter.ord + 1 
          ascii_code = 65 if ascii_code == 91
          ascii_code += 1 if ascii_code == TILE_LETTER.ord
          letter = ascii_code.chr
        end
        isUpcase = !isUpcase
      end
      assoc_obj[letter] = le
    end
    assoc_obj
  end
  
end