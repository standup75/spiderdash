class Game < ActiveRecord::Base
  extend FriendlyId
  include Duplicatable
  friendly_id :name, use: :slugged
  attr_accessible :name, :sizing_mode, :height, :width
  validates_presence_of :name, :sizing_mode, :height, :width
  validates_format_of :sizing_mode, :with => /\A(strict|fit)\z/, :message => "sizing mode should be strict or fit", :allow_nil => true
  has_many :worlds
  
  def as_json(option = {})
    {
      :name => self.name,
      :sizingMode => self.sizing_mode,
      :height => self.height,
      :width => self.width,
      :worlds => self.worlds.as_json
    }
  end

  def deep_delete
    self.worlds.each do |world|
      world.deep_delete
      world.destroy
    end
  end
  
  protected
  
  def duplicate_children(new_game)
    self.worlds.each do |world|
      world.duplicate new_game
    end
  end
end