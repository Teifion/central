import Config

config :central, Central.Setup, key: "dev_key"

# Configure your database
config :central, Central.Repo,
  username: "postgres",
  password: "postgres",
  database: "central_dev",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# assets_dir = Path.expand("../assets", __DIR__)

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with esbuild to bundle .js and .css sources.
config :central, CentralWeb.Endpoint,
  # Binding to loopback ipv4 address prevents access from other machines.
  # Change to `ip: {0, 0, 0, 0}` to allow access from other machines.
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "XCWufjXlxXiRdo989102cJLFeOsRzl0Cd854unoKCaoLexIlCDXUsxVVTbsm3JOW",
  watchers: [
    # Start the esbuild watcher by calling Esbuild.install_and_run(:default, args)
    esbuild: {Esbuild, :install_and_run, [:default, ~w(--sourcemap=inline --watch)]},
    dark_sass: {
      DartSass,
      :install_and_run,
      [:dark, ~w(--embed-source-map --source-map-urls=absolute --watch)]
    },
    light_sass: {
      DartSass,
      :install_and_run,
      [:light, ~w(--embed-source-map --source-map-urls=absolute --watch)]
    }
  ],
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/central_web/(live|views)/.*(ex)$",
      ~r"lib/central_web/templates/.*(eex)$"
    ]
  ]

config :dart_sass,
  version: "1.49.0",
  light: [
    args: ~w(scss/mdb.light.scss ../priv/static/assets/mdb_light.css),
    cd: Path.expand("../assets", __DIR__)
  ],
  dark: [
    args: ~w(scss/mdb.dark.scss ../priv/static/assets/mdb_dark.css),
    cd: Path.expand("../assets", __DIR__)
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime

config :central, Central.Communication.BlogFile, save_path: "/tmp/blog_files"

config :central, Oban,
  queues: false,
  crontab: false

config :logger,
  format: "[$level] $message\n",
  backends: [
    {LoggerFileBackend, :error_log},
    {LoggerFileBackend, :info_log},
    :console
  ]

config :logger, :error_log,
  path: "/tmp/error.log",
  level: :error

config :logger, :info_log,
  path: "/tmp/info.log",
  level: :info
