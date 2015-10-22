class Question < ActiveRecord::Base
  before_action :set_question, except: [:create]
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

  def create
    @question = Question.create(params[question_params])
  end

  def destroy
    @user.destroy
  end

  def update
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:user_id, :query, :description, :upvotes, :downvotes)
  end

end
