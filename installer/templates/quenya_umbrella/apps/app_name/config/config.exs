# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

# Configures quenya API pipelines
config :quenya,
  use_fake_handler: true,
  use_response_validator: true

# Configures ex_json_schema to use Quenya.FormatValidator for unkown format
config :ex_json_schema, :custom_format_validator, {Quenya.FormatValidator, :validate}

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configures application server port
config :<%= @app_name %>,
  http: [port: 4000]

# Joken configuration
config :joken,
  default_signer: "<%= @opts[:jwt_secret] %>",
  # four weeks
  default_exp: 4 * 7 * 24 * 60 * 60,
  iss: "<%= @app_name %>"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
