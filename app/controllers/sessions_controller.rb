class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new, :create]

  def new
  end

  def create
    session_params = params[:session]
    username_param = session_params[:username]
    user = User.find_by(username: username_param)

    if user 
      password_param = session_params[:password]
      if user.authenticate(password_param)
        # authenticated
        session[:user_id] = user.id
        flash[:success] = "Welcome back #{user.username}!"
        redirect_to root_path
      else
        flash.now[:error] = "Invalid password"
        render 'new', status: :unauthorized
      end
    else
      flash.now[:error] = "Invalid login details"
      render 'new', status: :not_found
    end
  end

  def destroy
    if logged_in?
      session[:user_id] = nil
      flash[:success] = "user logged out successfully"
    else
      flash[:error] = "no logged in session found."
    end
    redirect_to login_path
  end
end