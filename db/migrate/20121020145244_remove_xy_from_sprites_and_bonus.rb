class RemoveXyFromSpritesAndBonus < ActiveRecord::Migration
  def up
    remove_column :sprites, :x
    remove_column :sprites, :y
    remove_column :bonus, :x
    remove_column :bonus, :y
  end

  def down
    add_column :sprites, :x, :integer
    add_column :sprites, :y, :integer
    add_column :bonus, :x, :integer
    add_column :bonus, :y, :integer
  end
end
