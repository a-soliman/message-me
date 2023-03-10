class ChatroomController < ApplicationController
  def index
    redirect_to login_path unless logged_in?
    @messages = Message.all
    @message = Message.new
  end
end