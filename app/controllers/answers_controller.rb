class AnswersController < ApplicationController
  before_action :set_answer, except: [:create, :index]

  def create
    @answer = Answer.create(params[answer_params])
  end

  def destroy
    @answer.destroy
  end

  def update
  end

  def index
    @answers = Answer.all
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
