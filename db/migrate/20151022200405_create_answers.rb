class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :question_id
      t.text :description
      t.integer :upvotes
      t.integer :downvotes
      t.boolean :accepted

      t.timestamps null: false
    end
  end
end
