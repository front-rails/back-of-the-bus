class UsersController < ApplicationController
  before_action :set_user, except: [:create]
  def create
    @user = User.new(user_params)
    render 'error' unless @user.save
  end

  def update
    @user.update(user_params) ? (render 'show'):(render 'error')
  end

  def show
  end

  def destroy
    @user.destroy
    render json: "User has been destroyed"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def set_user
    begin
      @user = User.find(params[:id])
    rescue
      render 'not_found'
    end
  end
end
