class RemoveTiles < ActiveRecord::Migration
  def up
    remove_index :tiles, :slug
    drop_table :tiles
    remove_column :level_tiles, :tile_id
  end

  def down
    create_table :tiles do |t|
      t.string :slug
      t.string :name
      t.string :picture_url
      t.integer :size
      t.integer :set, :default => 0
      t.timestamps
    end
    add_index :tiles, :slug, unique: true
    add_column :level_tiles, :tile_id, :integer
  end
end
