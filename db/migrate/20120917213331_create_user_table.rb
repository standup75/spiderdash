class CreateUserTable < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :slug
      t.string :password_digest
      t.integer :high_score
      t.integer :high_level
      t.integer :role_id
      t.timestamps
    end
    add_index :users, :slug, unique: true
  end

  def down
    drop_table :users
    remove_index :users, :slug
  end
end
