class CreateSpriteTable < ActiveRecord::Migration
  def up
    create_table :sprites do |t|
      t.string :slug
      t.string :name
      t.string :family
      t.integer :x
      t.integer :y
      t.integer :frame_count_y
      t.string :options
      t.string :picture_url
      t.integer :set, :default => 0
      t.timestamps
    end
    add_index :sprites, :slug, unique: true
  end

  def down
    remove_index :sprites, :slug
    drop_table :sprites
  end
end
