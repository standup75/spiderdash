class AddLinkToWorldIdToCheckpoints < ActiveRecord::Migration
  def change
    add_column :checkpoints, :level_id, :integer
    add_column :checkpoints, :link_to_world_id, :integer
    add_column :checkpoints, :kind, :integer, :default => 0
  end
end
