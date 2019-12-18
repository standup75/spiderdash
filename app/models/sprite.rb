require "sprite_builder"

class Sprite < ActiveRecord::Base
  extend FriendlyId
  include Duplicatable
  include WithOptions
  attr_accessible :name, :set, :family, :helping_sprite_id
  validates_presence_of :name, :set, :family

  def as_json(opts = {})
    return nil unless helping_sprite_id.blank?
    level_sprite = opts[:level_sprite]
    res = {
      :name => self.family,
      :options => make_options(opts[:level_id]),
      :x => level_sprite.x,
      :y => level_sprite.y
    }
    if SpriteBuilder.respond_to? family.underscore
      res[:options].merge!(SpriteBuilder.send family.underscore, level_sprite)
    end
    res
  end
end