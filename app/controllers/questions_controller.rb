class QuestionsController < ApplicationController
  before_action :set_question, except: [:create, :index, :search]

  def upvote
    @question.upvotes+=1
    @question.votes_quality+=1
    @question.votes_count+=1
    @question.save
  end

  def downvote
    @question.downvotes+=1
    @question.votes_quality-=1
    @question.votes_count+=1
    @question.save
  end

  def search
    if params[:search]
      q = "%#{params[:search]}%"
      @questions = Question.search_questions(q)
      @answers = Answer.order('votes_quality DESC')
    end
  end


  def create
    @question = Question.new(question_params)
    @question.save ? (render 'show'):(render 'error')
  end

  def destroy
    @question.destroy
  end

  def update
    @question.update(question_params) ? (render 'show'):(render 'error')
  end

  def index
    @questions = Question.order('votes_quality DESC')
    @answers = Answer.order('votes_quality DESC')
  end

  def show
  end

  private

  def set_question
    begin
      @question = Question.find(params[:id])
    rescue
      render 'not_found'
    end
  end

  def question_params
    params.require(:question).permit(:user_id, :query, :description, :upvotes, :downvotes)
  end

end
