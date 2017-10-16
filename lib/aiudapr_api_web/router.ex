defmodule AiudaprApiWeb.Router do
  use AiudaprApiWeb, :router

  forward "/", Absinthe.Plug, schema: AiudaprApiWeb.Schema

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AiudaprApiWeb do
    pipe_through :api
  end
end
