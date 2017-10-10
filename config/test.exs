use Mix.Config

config :aiudapr_api, AiudaprApiWeb.Endpoint,
  http: [port: 4001],
  server: false

config :logger, level: :warn

config :aiudapr_api, AiudaprApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  database: "aiudapr_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
