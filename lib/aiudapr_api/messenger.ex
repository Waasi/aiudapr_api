defmodule AiudaprApi.Messenger do
  @behaviour TTFAuth.Messenger

  def send_message(from, to, body, code) do
    message = "#{body}\n Utiliza este codigo (#{code}) para acciones en Aiuda PR"
    Twilex.Messenger.send_sms(from, to, message)
  end
end
