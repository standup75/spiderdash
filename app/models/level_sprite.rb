class LevelSprite < ActiveRecord::Base
  include Duplicatable
  belongs_to :level
  belongs_to :sprite
  attr_accessible :level, :level_id, :x, :y, :sprite, :sprite_id

  def as_json(options = {})
  	sprite.as_json :level_sprite => self, :level_id => options[:level_id]
  end
end