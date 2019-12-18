class RemoveFrameCountYFromBonus < ActiveRecord::Migration
  def up
    remove_column :bonus, :frame_count_y
  end

  def down
    remove_column :bonus, :frame_count_y, :integer
  end
end
