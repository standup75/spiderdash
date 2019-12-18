class RemoveTileAttributesFromGame < ActiveRecord::Migration
  def up
  	remove_column :games, :tile_size
  	remove_column :games, :tile_count_x
  	remove_column :games, :tile_count_y
  end

  def down
  	add_column :games, :tile_size, :integer
  	add_column :games, :tile_count_x, :integer
  	add_column :games, :tile_count_y, :integer
  end
end
