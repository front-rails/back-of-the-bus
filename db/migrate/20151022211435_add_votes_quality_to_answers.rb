class AddVotesQualityToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :votes_quality, :integer
  end
end
