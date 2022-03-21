require_relative "boot"
require_relative "../app/middleware/app_bridge_middleware"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ASubtleWeb
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
     config.time_zone = "Eastern Time (US & Canada)"

    # Required to allow an embedded app to make cross-domain requests in the Shopify Admin.
    config.action_dispatch.cookies_same_site_protection = :none

    # App Bridge
    config.middleware.use AppBridgeMiddleware
    config.active_job.queue_adapter = :sidekiq
  end
end
