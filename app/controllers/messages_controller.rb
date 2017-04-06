class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    @translated_text = MessageTranslator.new(params[:message][:text], :yoda).translate

    @message = Message.create!(text: @translated_text, user: current_user)
    ActionCable.server.broadcast(
      'chat Chat Room',
      message: MessagesController.render(
        partial: 'messages/message',
        locals: { message: @message }
      )
    )
  end
end
