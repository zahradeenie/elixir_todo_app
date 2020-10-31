# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elixir_todo_app,
  ecto_repos: [ElixirTodoApp.Repo]

# Configures the endpoint
config :elixir_todo_app, ElixirTodoAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UJ52Chiz7NIM/zdCs33m/ZXeaWGd+geH7xzkSXcLjjyNyqTfNJhuZ5LrAZgtwm23",
  render_errors: [view: ElixirTodoAppWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ElixirTodoApp.PubSub,
  live_view: [signing_salt: "YbF+k+0X"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
