class RemoveLevelIndexFromLevel < ActiveRecord::Migration
  def up
    remove_column :levels, :level_index
  end

  def down
    add_column :levels, :level_index, :integer
  end
end
