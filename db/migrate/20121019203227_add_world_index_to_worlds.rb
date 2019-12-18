class AddWorldIndexToWorlds < ActiveRecord::Migration
  def change
    add_column :worlds, :world_index, :integer
  end
end
