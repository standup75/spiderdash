class LevelBonu < ActiveRecord::Base
  include Duplicatable
  belongs_to :level
  belongs_to :bonu
  attr_accessible :level, :level_id, :x, :y, :bonu, :bonu_id

  def as_json(options = {})
  	bonu.as_json({:x => self.x, :y => self.y})
  end
end