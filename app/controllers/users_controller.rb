class UsersController < ApplicationController
  before_action :check_login, except: [:create, :index]
  before_action :set_user, except: [:create, :index]
  before_action :check_user, only: [:update, :destroy, :index]

  def create
    @user = User.new(user_params)
    if @user.save
      render :show
    else
      render @user.errors
    end
  end

  def update
    if @user.update(user_params)
      render :show
    else
      render @user.errors
    end
  end

  def index
    @users = User.all
  end

  def show
  end

  def destroy
    @user.destroy
    render json: "User has been destroyed"
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end

  def set_user
    begin
      @user = User.find(params[:id])
    rescue
      render 'not_found'
    end
  end

  def check_user
    # render 'not_allowed' unless @user.id == params[:user_id]
  end
end
