use Mix.Config

config :aiudapr_api, AiudaprApiWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: []

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

config :aiudapr_api, AiudaprApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  database: "aiudapr_api_dev",
  hostname: "localhost",
  pool_size: 10

config :twilex,
  sid: System.get_env("TWILIO_SID"),
  token: System.get_env("TWILIO_TOKEN")
