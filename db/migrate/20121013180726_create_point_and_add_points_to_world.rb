class CreatePointAndAddPointsToWorld < ActiveRecord::Migration
  def up
    create_table :checkpoints do |t|
      t.integer :x
      t.integer :y
      t.integer :index
      t.integer :world_id
      t.timestamps
    end
    add_column :worlds, :grid_width, :integer
    add_column :worlds, :grid_height, :integer
    add_column :worlds, :picture_url, :string
    add_column :worlds, :map_picture_url, :string
  end

  def down
    drop_table :checkpoints
    remove_column :worlds, :grid_width
    remove_column :worlds, :grid_height
    remove_column :worlds, :picture_url
    remove_column :worlds, :map_picture_url
  end
end
