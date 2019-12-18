class RemoveFrameCountYFromSprites < ActiveRecord::Migration
  def up
    remove_column :sprites, :frame_count_y
  end

  def down
    remove_column :sprites, :frame_count_y, :integer, :default => 1
  end
end
