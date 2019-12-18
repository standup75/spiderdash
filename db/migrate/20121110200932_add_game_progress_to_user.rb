class AddGameProgressToUser < ActiveRecord::Migration
  def change
    add_column :users, :game_progress, :string
  end
end
