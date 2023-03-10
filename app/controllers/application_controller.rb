class ApplicationController < ActionController::Base
  helper_method :current_user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :logged_in?
  def logged_in?
    !!current_user
  end

  def redirect_if_logged_in
    redirect_to root_path if logged_in?
  end

  def require_user
    if !logged_in?
      flash[:error] = "you must be looged in.."
      redirect_to login_path
    end
    @user = current_user
  end
end
