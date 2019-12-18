class CreateTileTable < ActiveRecord::Migration
  def up
    create_table :tiles do |t|
      t.string :slug
      t.string :name
      t.string :picture_url
      t.integer :size
      t.integer :set, :default => 0
      t.timestamps
    end
    add_index :tiles, :slug, unique: true
  end

  def down
    remove_index :tiles, :slug
    drop_table :tiles
  end
end
