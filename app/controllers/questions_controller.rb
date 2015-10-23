class QuestionsController < ApplicationController
  before_action :set_question, except: [:create, :index, :search]
  before_action :check_login, except: [:show, :index, :search]

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
    else
      render json: "No results"
    end
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
    @answers = Answer.where("question_id = #{@question.id}").order('votes_quality DESC')
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:user_id, :query, :description, :upvotes, :downvotes)
  end

end
