class CreateOptionsTable < ActiveRecord::Migration
  def up
    create_table :options do |t|
      t.integer :sprite_id
      t.string :label
      t.string :content
      t.timestamps
    end
    remove_column :sprites, :options
  end

  def down
    drop_table :options
    add_column :sprites, :options, :string
  end
end
