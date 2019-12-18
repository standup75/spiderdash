class CreateRoleTable < ActiveRecord::Migration
  def up
    create_table :roles do |t|
      t.string :slug
      t.string :name
      t.string :description
      t.timestamps
    end
    add_index :roles, :slug, unique: true
  end

  def down
    remove_index :roles, :slug
    drop_table :roles
  end
end
