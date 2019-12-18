class CreateLevelTilesTable < ActiveRecord::Migration
  def up
    create_table :level_tiles do |t|
      t.integer :level_id
      t.integer :tile_id
      t.integer :x
      t.integer :y
      t.timestamps
    end
  end

  def down
    drop_table :level_tiles
  end
end
