class RenameLevelIndexToCpIndexInCheckpoints < ActiveRecord::Migration
  def up
    rename_column :checkpoints, :level_index, :cp_index
  end

  def down
    rename_column :checkpoints, :cp_index, :level_index
  end
end
