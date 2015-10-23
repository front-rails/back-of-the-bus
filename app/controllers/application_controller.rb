class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  private

  def check_login
  #  render json "Not logged in" unless User.find(params[:user_id]).auth_token == params[:auth_token] &&
  return true
  end

end
