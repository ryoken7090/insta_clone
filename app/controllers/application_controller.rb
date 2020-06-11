class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def authenticate_user
    unless logged_in?
      redirect_to new_session_path
      # noticeとかでログインをしてくださいって
    end
  end


end
