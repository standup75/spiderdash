require "path"
# In this module we add dynamic properties to sprites

module SpriteBuilder
  class << self
    def deadly_zone(level_sprite)
      path = Path.new level_sprite
      { :deadly_path => path.build }
    end
  end
end