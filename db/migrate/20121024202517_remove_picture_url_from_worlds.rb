class RemovePictureUrlFromWorlds < ActiveRecord::Migration
  def up
    remove_column :worlds, :picture_url
    remove_column :worlds, :map_picture_url
  end

  def down
    add_column :worlds, :picture_url, :string
    add_column :worlds, :map_picture_url, :string
  end
end
