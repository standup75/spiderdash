class RemoveBetaPassFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :beta_pass
  end

  def down
    add_column :users, :beta_pass, :string
  end
end
