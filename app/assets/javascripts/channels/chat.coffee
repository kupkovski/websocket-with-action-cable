App.chat = App.cable.subscriptions.create { channel: "ChatChannel", room: "Chat Room" },
  received: (data) ->
    @appendLine(data)

  appendLine: (data) ->
    html = @createLine(data)
    $("[data-chat-room='Chat Room']").append(html)

  createLine: (data) ->
    data.message