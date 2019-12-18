class AddUseragentToGameData < ActiveRecord::Migration
  def change
    add_column :game_data, :user_agent, :string
  end
end
