class ChatroomsController < ApplicationController
  def index
    @chatrooms = current_user.chatrooms
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @chatroom = Chatroom.new(first_user: current_user, second_user: User.find(params[:user_id]))

    if @chatroom.save!
      redirect_to chatroom_path(@chatroom)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
