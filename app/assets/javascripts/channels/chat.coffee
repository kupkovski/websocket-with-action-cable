App.chat = App.cable.subscriptions.create { channel: "ChatChannel", room: "Best Room" },
  received: (data) ->
    @appendLine(data)

  appendLine: (data) ->
    html = @createLine(data)
    $("[data-chat-room='Best Room']").append(html)

  createLine: (data) ->
    console.warn('data', data)
    """
    <article class="chat-line">
      <span class="body">#{data.message}</span>
    </article>
    """