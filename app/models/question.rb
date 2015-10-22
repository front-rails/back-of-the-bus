class Question < ActiveRecord::Base
  validates :query, presence: true
  validates :description, presence: true
  belongs_to :user
  has_many :answers

  def votes_quality
    upvotes - downvotes
  end

  def votes_count
    upvotes + downvotes
  end

end
