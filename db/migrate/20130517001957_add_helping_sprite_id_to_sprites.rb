class AddHelpingSpriteIdToSprites < ActiveRecord::Migration
  def change
    add_column :sprites, :helping_sprite_id, :integer
  end
end
