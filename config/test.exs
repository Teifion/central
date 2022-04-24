import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
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
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "dxywCOobydyDzu0gNGFE/cJ2J1OkQVQCMheiInQvBjebQND+z5stcIWX8WkBi2Xo",
  server: false

config :central, Central.Mailer,
  adapter: Bamboo.TestAdapter,
  noreply_address: "noreply@testsite.co.uk",
  contact_address: "info@testsite.co.uk"

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :central, Oban,
  queues: false,
  plugins: false,
  crontab: false
