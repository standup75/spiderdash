class AddLevelIdToOptions < ActiveRecord::Migration
  def change
    add_column :options, :level_id, :integer
  end
end
