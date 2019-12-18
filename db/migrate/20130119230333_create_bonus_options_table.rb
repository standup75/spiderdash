class CreateBonusOptionsTable < ActiveRecord::Migration
  def up
    create_table :bonus_options do |t|
      t.integer :bonu_id
      t.string :label
      t.string :content
      t.timestamps
    end
  end

  def down
    drop_table :bonus_options
  end
end

