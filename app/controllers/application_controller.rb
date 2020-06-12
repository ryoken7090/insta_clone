class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def authenticate_user
    unless logged_in?
      flash[:success] = 'ログインしてください'
      redirect_to new_session_path
    end
  end


end
