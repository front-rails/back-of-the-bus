class UsersController < ApplicationController
  before_action :set_user, except: [:create]
  def create
    @user = User.create(user_params)
  end

  def update
    @user.update(user_params)
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
    @user = User.find(params[:id])
  end
end
