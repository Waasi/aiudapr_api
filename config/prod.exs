use Mix.Config

config :aiudapr_api, AiudaprApiWeb.Endpoint,
  load_from_system_env: true,
  url: [scheme: "https", host: System.get_env("HEROKU_HOST"), port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  secret_key_base: System.get_env("SECRET_KEY_BASE")

config :logger, level: :info

config :aiudapr_api, AiudaprApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: System.get_env("POOL_SIZE"),
  ssl: true

config :twilex,
  sid: System.get_env("TWILIO_SID"),
  token: System.get_env("TWILIO_TOKEN")
