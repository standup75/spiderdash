class Option < ActiveRecord::Base
  include Duplicatable
  attr_accessible :label, :content, :sprite_id, :bonu_id, :level_id
  validates_presence_of :label, :content
  belongs_to :sprite
  belongs_to :bonu
  belongs_to :level
end