require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
# Created 4-12-19 by Anna Yu edited to use mailer options
Bundler.require(*Rails.groups)

module BookApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    ActionMailer::Base.smtp_settings = {
        address: 'smtp.gmail.com',
        port: 587,
        domain: 'gmail.com',
        user_name: 'dummy.email.3901@gmail.com',
        password: 'OSUCSE3901',
        authentication: 'plain',
        enable_starttls_auto: true
    }
  end
end
