class AnswersController < ApplicationController
  before_action :set_answer, except: [:create, :index]

  def accept
    @answer.accepted = !@answer.accepted
    @answer.save
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
    @answer = Answer.create(params[answer_params])
  end

  def destroy
    @answer.destroy
  end

  def update
  end

  def index
    @answers = Answer.order('votes_quality DESC')
  end

  def show
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:user_id, :question_id, :description, :upvotes, :downvotes, :accepted)
  end
end
