class AddBonuIdToOptions < ActiveRecord::Migration
  def change
    add_column :options, :bonu_id, :integer
  end
end
