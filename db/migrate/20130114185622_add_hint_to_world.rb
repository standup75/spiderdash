class AddHintToWorld < ActiveRecord::Migration
  def change
    add_column :worlds, :hint, :string
  end
end
