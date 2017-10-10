defmodule AiudaprApi.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(AiudaprApi.Repo, []),
      supervisor(AiudaprApiWeb.Endpoint, []),
    ]

    opts = [strategy: :one_for_one, name: AiudaprApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    AiudaprApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
