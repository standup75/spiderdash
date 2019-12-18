class AddUuidToGameData < ActiveRecord::Migration
  def change
    add_column :game_data, :uuid, :string
  end
end
