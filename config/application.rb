require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Calendar
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Set default From address for all Mailers
    config.action_mailer.default_options = { from: ENV.fetch("MAILER_SENDER_ADDRESS") }
  end
end
