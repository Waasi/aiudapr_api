defmodule AiudaprApiWeb.AuthenticationResolver do
  alias TTFAuth.Dispatcher

  def create(%{phone: entity}, _info) do
    Dispatcher.create_passport(entity, "7873392324", "Bienvenido a la comunidad de Aiuda PR.")
    {:ok, entity}
  end
end
