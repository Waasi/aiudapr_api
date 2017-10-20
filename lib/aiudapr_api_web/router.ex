defmodule AiudaprApiWeb.Router do
  use AiudaprApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug TTFAuth.Plugs.GQLSheriff
  end

  scope "/" do
    pipe_through :api
    forward "/", Absinthe.Plug, schema: AiudaprApiWeb.Schema
  end
end
