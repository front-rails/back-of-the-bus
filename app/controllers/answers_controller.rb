class AnswersController < ApplicationController
  before_action :check_login, except: [:show, :index]
  before_action :set_answer, except: [:create, :index]
  before_action :check_user, only: [:update, :destroy]


  def accept
    if @answer.accepted == true || Question.where("id = #{@answer}.question_id").answers.all? { |a| a.accepted == false}
      @answer.accepted = !@answer.accepted
      @answer.save
    else
    end
  end

  def upvote
    @answer.upvotes += 1
    @answer.votes_quality += 1
    @answer.save
  end

  def downvote
    @answer.downvotes += 1
    @answer.votes_quality -= 1
    @answer.save
  end

  def create
    @answer = Answer.new(params[answer_params])
    @answer.votes_quality = 0
    @answer.save ? (render 'show'):(render 'error')
  end

  def destroy
    @answer.destroy
  end

  def update
    @answer.update(answer_params) ? (render 'show'):(render 'error')
  end

  def show
  end

  private

  def set_answer
    begin
      @answer = Answer.find(params[:id])
    rescue
      render 'not_found'
    end
  end

  def answer_params
    params.permit(:user_id, :question_id, :description, :upvotes, :downvotes, :accepted)
  end

  def check_user
    # render 'not_allowed' unless @answer.user_id == params[:user_id]
  end
end
