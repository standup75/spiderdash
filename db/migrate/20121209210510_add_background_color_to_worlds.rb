class AddBackgroundColorToWorlds < ActiveRecord::Migration
  def change
    add_column :worlds, :background_color, :string
  end
end
