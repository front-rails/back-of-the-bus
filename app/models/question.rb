class Question < ActiveRecord::Base
  validates :query, presence: true
  validates :description, presence: true
  belongs_to :user
  has_many :answers

  def self.search_questions(q)
      search_results = Question.where("question LIKE ? OR answer LIKE ?", q, q).order('votes_quality DESC')
      return search_results.uniq!
  end

  def votes_count
    upvotes + downvotes
  end

end
