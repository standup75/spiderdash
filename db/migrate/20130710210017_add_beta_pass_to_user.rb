class AddBetaPassToUser < ActiveRecord::Migration
  def change
    add_column :users, :beta_pass, :string
  end
end
