class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :question_id
      t.text :description
      t.integer :upvotes, default: 0
      t.integer :downvotes, default: 0
      t.boolean :accepted, default: false

      t.timestamps null: false
    end
  end
end
