class LevelTile < ActiveRecord::Base
  include Duplicatable
  belongs_to :level
  attr_accessible :level, :level_id, :x, :y
end