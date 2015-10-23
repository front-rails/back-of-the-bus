class SessionsController < ApplicationController

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      generate_token
      @user.save
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
