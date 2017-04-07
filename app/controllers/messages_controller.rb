class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    renderer = ApplicationController.renderer.new
    warden = env['warden']
    renderer.instance_variable_set(
      :@env,
      'HTTP_HOST' => 'localhost:3000',
      'HTTPS' => 'off',
      'REQUEST_METHOD' => 'GET',
      'SCRIPT_NAME' => '',
      'warden' => warden
    )

    @message = Message.create!(text: params[:message][:text], user: current_user)
    ActionCable.server.broadcast(
      'chat Chat Room',
      message: renderer.render(
        partial: 'messages/message',
        locals: { message: @message }
        )
      )
  end
end
