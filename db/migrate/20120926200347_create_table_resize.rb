class CreateTableResize < ActiveRecord::Migration
  def up
    create_table :resizes do |t|
      t.integer :tile_id
      t.integer :x
      t.integer :y
      t.string :url
      t.timestamps
    end
  end

  def down
    drop_table :resizes
  end
end
