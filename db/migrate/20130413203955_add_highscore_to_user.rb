class AddHighscoreToUser < ActiveRecord::Migration
  def change
    add_column :users, :highscore, :integer, :default => 0
  end
end
