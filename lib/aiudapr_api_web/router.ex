defmodule AiudaprApiWeb.Router do
  use AiudaprApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AiudaprApiWeb do
    pipe_through :api
  end
end
