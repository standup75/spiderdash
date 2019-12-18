class AddLevelIndexToLevels < ActiveRecord::Migration
  def change
    add_column :levels, :level_index, :integer
  end
end
