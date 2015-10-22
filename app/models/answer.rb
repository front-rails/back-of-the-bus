class Answer < ActiveRecord::Base
  validates :description, presence: true
  belongs_to :user
  belongs_to :question

  def votes_quality
    @answer.sum(&:upvotes) - @answer.sum(&:downvotes)
  end

  def votes_count
    @answer.upvotes.count + @answer.downvotes.count
  end

end
