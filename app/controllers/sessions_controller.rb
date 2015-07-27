class SessionsController < ApplicationController
  skip_before_action :redirct_to_login
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.user_name}."
      redirect_to home_index_path
    else
      flash[:danger] = 'Invalid login.'
      render :back
    end
  end

  def destroy
    flash[:success] = "You have successfully signed out."
    session.clear
    redirect_to root_path
  end
end
