class QuestionsController < ApplicationController
  before_action :check_login, except: [:show, :index, :search]
  before_action :set_question, except: [:create, :index, :search]
  before_action :check_user, only: [:update, :destroy]

  def upvote
    @question.upvotes+=1
    @question.votes_quality+=1
    if @question.save
      render :show
    else
      render @question.errors
    end
  end

  def downvote
    @question.downvotes+=1
    @question.votes_quality-=1
    if @question.save
      render :show
    else
      render @question.errors
    end
  end

  def search
    if params[:search]
      q = "%#{params[:search]}%"
      @questions = Question.search_questions(q)
      @answers = Answer.order('accepted DESC').order('votes_quality DESC')
    else
      render json: "No results"
    end
  end


  def create
    @question = Question.new(question_params)
    @question.votes_quality = 0
    if @question.save
      render :show
    else
      render @question.errors
    end
  end

  def destroy
    @question.destroy
  end

  def update
    if @question.update(question_params)
      render :show
    else
      render @question.errors
    end
  end

  def index
    @questions = Question.order('votes_quality DESC')
    @answers = Answer.order('accepted DESC').order('votes_quality DESC')
  end

  def show
    @answers = Answer.where("question_id = #{@question.id}").order('accepted DESC').order('votes_quality DESC')
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
    params.permit(:user_id, :query, :description, :upvotes, :downvotes)
  end

  def check_user
    # render 'not_allowed' unless @question.user_id == params[:user_id]
  end

end
