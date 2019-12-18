class CreateGameTable < ActiveRecord::Migration
  def up
    create_table :games do |t|
      t.string :slug
      t.string :name
      t.integer :tile_size
      t.integer :tile_count_x
      t.integer :tile_count_y
      t.timestamps
    end
    add_index :games, :slug, unique: true
  end

  def down
    remove_index :games, :slug
    drop_table :games
  end
end
