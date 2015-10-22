class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.string :query
      t.text :description
      t.integer :upvotes
      t.integer :downvotes

      t.timestamps null: false
    end
  end
end
