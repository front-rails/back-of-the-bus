class Question < ActiveRecord::Base
  validates :query, presence: true
  validates :description, presence: true
  belongs_to :user
  has_many :answers

  def votes_quality
    @question.sum(&:upvotes) - @question.sum(&:downvotes)
  end

  def votes_count
    @question.upvotes.count + @question.downvotes.count
  end

end
