class RenameIndexInLevelToLevelIndex < ActiveRecord::Migration
  def change
  	rename_column :levels, :index, :level_index
  end
end
