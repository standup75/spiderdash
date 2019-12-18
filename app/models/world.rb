class World < ActiveRecord::Base
  extend FriendlyId
  include Duplicatable
  friendly_id :name, use: :slugged
  attr_accessible :name, :game, :game_id, :grid_width, :grid_height, :world_index, :background_color, :hint
  validates_presence_of :name, :grid_width, :grid_height, :background_color
  has_many :levels, -> { order('level_index DESC') }
  has_many :checkpoints
  belongs_to :game
  default_scope -> { order('world_index ASC') }
  before_create :set_index

  def as_json(options = {})
    {
      :name => self.name,
      :slug => self.slug,
      :gridWidth => self.grid_width,
      :gridHeight => self.grid_height,
      :checkpoints => self.checkpoints.as_json,
      :index => self.world_index,
      :hint => self.hint,
      :color => self.background_color
    }
  end
  
  def deep_delete
    self.levels.each do |level|
      level.destroy
    end
  end

  def set_checkpoints(new_checkpoints)
    self.checkpoints.delete_all
    self.levels.each do |level|
      level.update_attribute :level_index, nil
    end
    if new_checkpoints
      Level.reset_world self.id
      level_index = 1
      cp_index = 0
      new_checkpoints.each do |cp|
        cp["levelId"] = nil unless cp["kind"] == CHECKPOINT_BONUS_LEVEL or cp["kind"] == CHECKPOINT_LEVEL
        cp["linkToWorldId"] = nil unless cp["kind"] == CHECKPOINT_WORLD_GATE or cp["kind"] == CHECKPOINT_WORLD_BEGIN or cp["kind"] == CHECKPOINT_WORLD_END
        if cp["levelId"] and cp["kind"] == CHECKPOINT_LEVEL
          Level.find(cp["levelId"]).update_attribute(:level_index, level_index) 
          level_index += 1
        end
        Checkpoint.create(
          :x => cp["x"],
          :y => cp["y"],
          :cp_index => cp_index,
          :world_id => self.id,
          :level_id => cp["levelId"],
          :link_to_world_id => cp["linkToWorldId"],
          :kind => cp["kind"] || CHECKPOINT_LEVEL)
        cp_index += 1
      end
    end
  end

  def create_initial_chepoints
    Checkpoint.create :world_id => self.id, :x => self.grid_width/2, :y =>self.grid_height-1, :cp_index => 0, :kind => CHECKPOINT_WORLD_BEGIN
    Checkpoint.create :world_id => self.id, :x => self.grid_width/2, :y =>self.grid_height/2, :cp_index => 1, :kind => CHECKPOINT_LEVEL
    Checkpoint.create :world_id => self.id, :x => self.grid_width/2, :y =>0, :cp_index => 2, :kind => CHECKPOINT_WORLD_END
  end
  
  protected
  
  def duplicate_children(new_world)
    self.levels.each do |level|
      level.duplicate new_world
    end
    self.checkpoints.each do |cp|
      cp.duplicate new_world
    end
  end
  
  def set_index
    if game_id and not world_index
      world_index = World.where(:game_id => game_id).count
    end
  end
end