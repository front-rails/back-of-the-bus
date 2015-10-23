class QuestionsController < ApplicationController
  before_action :set_question, except: [:create, :index, :search]

  def upvote
    @question.upvotes+=1
    @question.votes_quality+=1
    @question.votes_count+=1
  end

  def downvote
    @question.downvotes+=1
    @question.votes_quality-=1
    @question.votes_count+=1
  end

  def search
    @questions = search_questions
    @answers = Answer.order('votes_quality DESC')
  end

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
