class CreateFeedbackTable < ActiveRecord::Migration
  def up
    create_table :feedbacks do |t|
      t.text :content
      t.integer :user_id
      t.string :user_agent
      t.timestamps
    end
  end

  def down
    drop_table :feedbacks
  end
end
