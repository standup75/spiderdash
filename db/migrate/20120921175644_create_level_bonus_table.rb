class CreateLevelBonusTable < ActiveRecord::Migration
  def up
    create_table :level_bonus do |t|
      t.integer :level_id
      t.integer :bonu_id
      t.integer :x
      t.integer :y
      t.timestamps
    end
  end

  def down
    drop_table :level_bonus
  end
end
