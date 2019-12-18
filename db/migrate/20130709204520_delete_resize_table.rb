class DeleteResizeTable < ActiveRecord::Migration
  def up
    drop_table :resizes
  end

  def down
    create_table :resizes do |t|
      t.integer :tile_id
      t.integer :x
      t.integer :y
      t.string :url
      t.timestamps
    end
  end
end
