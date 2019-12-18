class AddSpeedToLevels < ActiveRecord::Migration
  def change
    add_column :levels, :speed, :integer, :default => 100
  end
end
