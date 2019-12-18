class AddSizingsToGames < ActiveRecord::Migration
  def up
  	add_column :games, :sizing_mode, :string
  	add_column :games, :width, :integer
  	add_column :games, :height, :integer
  end

  def down
  	remove_column :games, :sizing_mode
  	remove_column :games, :height
  	remove_column :games, :width
  end
end
