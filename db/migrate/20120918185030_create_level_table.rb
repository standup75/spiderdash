class CreateLevelTable < ActiveRecord::Migration
  def up
    create_table :levels do |t|
      t.string :slug
      t.string :name
      t.integer :tile_count_x
      t.integer :tile_count_y
      t.integer :index
      t.integer :world_id
      t.integer :set, :default => 0
      t.timestamps
    end
    add_index :levels, :slug, unique: true
  end

  def down
    remove_index :levels, :slug
    drop_table :levels
  end
end
