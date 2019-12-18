class CreateGameDataTable < ActiveRecord::Migration
  def up
    create_table :game_data do |t|
      t.integer :level_id
      t.integer :user_id
      t.integer :star_count
      t.integer :time
      t.integer :status
    end
  end

  def down
    drop_table :game_data
  end
end
