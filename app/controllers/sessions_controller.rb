class SessionsController < ApplicationController

  def create
    @user = User.find_by_email(session_params[:email])
    if @user && @user.authenticate(session_params[:password])
      generate_token
      @user.save
      render @user
    end
  end

  def destroy
    find_user
    @user.token = nil
  end

  private

  def generate_token
    @user.token = SecureRandom.hex(10)
  end

  def find_user
    @user = User.find(params[:user_id])
  end

end
