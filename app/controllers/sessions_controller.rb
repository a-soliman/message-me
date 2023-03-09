class SessionsController < ApplicationController
  def new
    redirect_to root_path if logged_in?
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
        flash[:notice] = "Welcome back #{user.username}!"
        redirect_to root_path
      else
        flash.now[:alert] = "Invalid password"
        render 'new', status: :unauthorized
      end
    else
      flash.now[:alert] = "Invalid login details"
      render 'new', status: :not_found
    end
  end

  def destroy
    if logged_in?
      session[:user_id] = nil
      flash[:notice] = "user logged out successfully"
    else
      flash[:alert] = "no logged in session found."
    end
    redirect_to login_path
  end
end