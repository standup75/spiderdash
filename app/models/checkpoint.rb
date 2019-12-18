class Checkpoint < ActiveRecord::Base
  include Duplicatable
  attr_accessible :x, :y, :cp_index, :world_id, :link_to_world_id, :world, :kind, :level_id
  validates_presence_of :x, :y, :cp_index, :world_id, :kind
  belongs_to :level
  default_scope -> { order("cp_index ASC") }
  scope :missing_assignments, -> {
    where("((kind = #{CHECKPOINT_LEVEL} OR kind = #{CHECKPOINT_BONUS_LEVEL}) AND level_id IS NULL) OR (kind = #{CHECKPOINT_WORLD_GATE} AND link_to_world_id IS NULL)")
  }
  
  def as_json(options = {})
    res = {
    	:id => id,
      :kind => kind,
      :worldId => world_id,
      :linkToWorldId => link_to_world_id,
      :linkToWorldIndex => link_to_world_index,
      :index => cp_index,
      :x => x,
      :y => y
    }
    if not level_id.blank?
      if not options.blank? and options[:with_level_id]
        res[:levelId] = level_id
      else
        res[:level] = level.as_json
      end
    end
    res
  end

  private

  def link_to_world_index
    if link_to_world_id
      World.find(link_to_world_id).world_index
    else
      nil
    end
  end
end