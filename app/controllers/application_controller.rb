class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :redirct_to_login


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def redirct_to_login
    unless current_user
      redirect_to login_path
    end
  end
end
