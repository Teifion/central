# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :central,
  ecto_repos: [Central.Repo]

config :central, Extensions,
  applications: [Example.Application],
  startups: [Example.Startup],
  routers: [ExampleWeb.Router],
  index_views: [ExampleWeb.CentralView],
  side_views: [ExampleWeb.CentralView]

config :central, Central,
  site_title: "Central",
  site_description: "Description goes here",
  site_icon: "fas fa-broadcast-tower",
  enable_blog: true,
  blog_title: "Site blog",
  # This is used for the coverage tool
  file_path: "~/programming/central/",
  credit: "Your name here"

# Default configs
config :central, Central.Config,
  defaults: %{
    tz: "UTC"
  }


# Configures the endpoint
config :central, CentralWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XpxFQRKQYVZmsVcDmPNqPyC7jjOCtIDv4WYtAS1pXAOux10m6sbvqTccijhsczpY",
  render_errors: [view: CentralWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Central.PubSub,
  live_view: [signing_salt: "SPwrn1bR"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :central, Central.Mailer,
  noreply_name: "noreply",
  noreply_address: "noreply@domain",
  contact_address: "contact@domain"

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.12.18",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2016 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# This secret key is overwritten in prod.secret.exs
config :central, Central.Account.Guardian,
  issuer: "central",
  secret_key: "UMvfKwEWwOY5g+jUIbnU0zIXUCc8RY6tI+hc8CxoKqBKjKpwdy3VFbFrKk3GI/a0",
  ttl: {30, :days}

config :central, Central.Communication.BlogFile, save_path: "/etc/central/blog_files"

config :central, Oban,
  repo: Central.Repo,
  plugins: [
    {Oban.Plugins.Pruner, max_age: 3600},
    {Oban.Plugins.Cron,
      crontab: [
        # Every hour
        {"0 * * * *", Central.Admin.CleanupTask},

        # Every day at 2am
        {"0 2 * * *", Central.Logging.AggregateViewLogsTask}
      ]
    }
  ],
  queues: [logging: 1, cleanup: 1]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
