class RemoveOptionsFromBonus < ActiveRecord::Migration
  def up
    remove_column :bonus, :options
  end

  def down
    remove_column :bonus, :options, :integer
  end
end
