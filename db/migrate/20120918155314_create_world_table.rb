class CreateWorldTable < ActiveRecord::Migration
  def up
    create_table :worlds do |t|
      t.string :slug
      t.string :name
      t.integer :game_id
      t.timestamps
    end
    add_index :worlds, :slug, unique: true
  end

  def down
    remove_index :worlds, :slug
    drop_table :worlds
  end
end
