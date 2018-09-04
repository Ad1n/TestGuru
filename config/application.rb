require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    #<ActiveSupport::TimeZone:0x007ffa9f845b60 @name="Moscow", @utc_offset=nil,
    # @tzinfo=#<TZInfo::DataTimezone: Europe/Moscow>>
    config.time_zone = 'Moscow'
    config.i18n.default_locale = :ru
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.autoload_paths << "#{Rails.root}/lib/clients"
  end
end
