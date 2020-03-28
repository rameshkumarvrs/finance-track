require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FinanceTrack
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    IEX::Api.configure do |config|
    	config.publishable_token = 'Tpk_0b1b113041e34abebd0bb46362fcae8e'
    	config.secret_token = 'Tsk_0e977b9338fc41aa902328f60db29834'
    	config.endpoint = 'https://sandbox.iexapis.com/v1'
    end	 
  end
end
