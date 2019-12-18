class RemovePictureUrlFromSpritesAndBonus < ActiveRecord::Migration
  def up
  	remove_column :sprites, :picture_url
  	remove_column :bonus, :picture_url
  end

  def down
  	add_column :sprites, :picture_url, :string
  	add_column :bonus, :picture_url, :string
  end
end
