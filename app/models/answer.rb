class Answer < ActiveRecord::Base
  validates :description, presence: true
  belongs_to :user
  belongs_to :question

  def votes_count
    upvotes + downvotes
  end

end
