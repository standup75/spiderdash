class DeleteBonusOptionTable < ActiveRecord::Migration
  def up
    drop_table :bonus_options
  end

  def down
    create_table :bonus_options do |t|
      t.integer :bonu_id
      t.string :label
      t.string :content
      t.timestamps
    end
  end
end
