class AddDefaults < ActiveRecord::Migration
  def up
      change_column :levels, :tile_count_x, :integer, :default => 20
      change_column :levels, :tile_count_y, :integer, :default => 20
      change_column :sprites, :frame_count_y, :integer, :default => 1
      change_column :worlds, :grid_width, :integer, :default => 20
      change_column :worlds, :grid_height, :integer, :default => 20
  end

  def down
      change_column :levels, :tile_count_x, :integer, :default => nil
      change_column :levels, :tile_count_y, :integer, :default => nil
      change_column :sprites, :frame_count_y, :integer, :default => nil
      change_column :worlds, :grid_width, :integer, :default => nil
      change_column :worlds, :grid_height, :integer, :default => nil
  end
end
