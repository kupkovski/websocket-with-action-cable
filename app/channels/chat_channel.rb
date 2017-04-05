class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat #{params[:room]}"
  end

  def unsubscribed
    stop_all_streams
  end
end
