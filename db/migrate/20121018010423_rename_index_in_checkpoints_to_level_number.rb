class RenameIndexInCheckpointsToLevelNumber < ActiveRecord::Migration
  def change
  	rename_column :checkpoints, :index, :level_index
  end
end
