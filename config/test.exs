use Mix.Config

# Configure your database
config :central, Central.Repo,
  username: "postgres",
  password: "postgres",
  database: "central_test",
  hostname: "localhost",
  timeout: 120_000,
  queue_target: 5000,
  queue_interval: 100_000,
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :central, CentralWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :central, Oban,
  queues: false,
  plugins: false,
  crontab: false

config :central, Central.Mailer,
  adapter: Bamboo.TestAdapter,
  noreply_address: "noreply@testsite.co.uk",
  contact_address: "info@testsite.co.uk"
