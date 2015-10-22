class AddVotesQualityToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :votes_quality, :integer
  end
end
