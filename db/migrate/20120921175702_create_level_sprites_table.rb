class CreateLevelSpritesTable < ActiveRecord::Migration
  def up
    create_table :level_sprites do |t|
      t.integer :level_id
      t.integer :sprite_id
      t.integer :x
      t.integer :y
      t.timestamps
    end
  end

  def down
    drop_table :level_sprites
  end
end
