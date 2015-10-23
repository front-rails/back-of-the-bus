class QuestionsController < ApplicationController
  before_action :set_question, except: [:create, :index]

  def create
    @question = Question.create(params[question_params])
  end

  def destroy
    @question.destroy
  end

  def update
  end

  def index
    @questions = Question.order('votes_quality DESC')
    @answers = Answer.order('votes_quality DESC')
  end

  def show
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:user_id, :query, :description, :upvotes, :downvotes)
  end

end
