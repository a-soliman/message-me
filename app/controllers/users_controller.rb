class UsersController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "Welcome #{@user.username}, you have successfuly signed up."
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new', status: :bad_request
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end