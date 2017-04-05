class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    @message = Message.create! text: params[:message][:text]
    ActionCable.server.broadcast(
      'chat Chat Room',
      message: MessagesController.render(
        partial: 'messages/message',
        locals: { message: @message }
      )
    )
  end
end
