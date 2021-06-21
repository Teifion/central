use Mix.Config

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
  live_view: [signing_salt: "wZVVigZo"],
  render_errors: [view: CentralWeb.ErrorView, accepts: ~w(html json)],
  pubsub_server: Central.PubSub

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

config :central, Central.General.LoadTestServer, enable_loadtest: false

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

config :central, Central.Mailer,
  noreply_name: "Example.co.uk Noreply",
  noreply_name: "Example.co.uk Contact",
  adapter: Bamboo.SMTPAdapter

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
