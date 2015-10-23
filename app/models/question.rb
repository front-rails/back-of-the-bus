class Question < ActiveRecord::Base
  validates :query, presence: true
  validates :description, presence: true
  belongs_to :user
  has_many :answers

  def self.search_questions(q)
      search_results = Question.joins(:answers).
          where("query LIKE ? OR questions.description LIKE ? OR answers.description LIKE ?", q, q, q).order('votes_quality DESC')
      search_results.uniq!
      return search_results
  end

  def votes_count
    upvotes + downvotes
  end

end
