class AnswersController < ApplicationController
  before_action :set_answer, except: [:create, :index]
  before_action :check_login, except: [:show, :index]

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
    @answer.votes_count += 1
    @answer.save
  end

  def downvote
    @answer.downvotes += 1
    @answer.votes_quality -= 1
    @answer.votes_count += 1
    @answer.save
  end

  def create
    @answer = Answer.new(params[answer_params])
    @answer.save ? (render 'show'):(render 'error')
  end

  def destroy
    @answer.destroy
  end

  def update
    @answer.update(question_params) ? (render 'show'):(render 'error')
  end

  def index
    @answers = Answer.order('votes_quality DESC')
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
    params.require(:answer).permit(:user_id, :question_id, :description, :upvotes, :downvotes, :accepted)
  end
end
