class SessionsController < ApplicationController

  def create
    if params[:email] && params[:password]
      @user = User.find_by_email(params[:email])
      if @user && @user.authenticate(params[:password])
        generate_token
        @user.save
      else
        render json: "Invalid login"
      end
    else
      render json: "You must enter an email address and password"
    end
  end

  def destroy
    find_user
    @user.auth_token = nil
    @user.save
  end

  private

  def generate_token
    @user.auth_token = SecureRandom.hex(10)
    @user.save
  end

  def find_user
    @user = User.find(params[:user_id])
  end

end
