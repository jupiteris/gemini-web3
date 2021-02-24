require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
require_relative 'env_variables'

module GeminiStartBackend
  class Application < Rails::Application
    config.secret_key_base = ENV['SECRET_KEY_BASE']
    config.autoload_paths += %W(#{config.root}/lib)

    # Rails 5 CORS Config
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], expose: ['Access-Token', 'Uid', 'Client', 'Content-Type']
      end
    end

    # Mail config
    # ActionMailer::Base.smtp_settings = {
    #     :address => 'smtps.aruba.it',
    #     :port => 465,
    #     :domain => 'imap.geminismart.cloud',
    #     :authentication => 'plain',
    #     :user_name => 'info@geoplansrl.com',
    #     :password => 'geminismart',
    #     :enable_starttls_auto => true,
    #     :ssl => true,
    #     :openssl_verify_mode => OpenSSL::SSL::VERIFY_NONE
    # }

    # gmail smtp
    # ActionMailer::Base.smtp_settings = {
    #     :address => 'smtp.gmail.com',
    #     :port => 587,
    #     :authentication => 'plain',
    #     :user_name => 'jupiter.programmer@gmail.com',
    #     :password => 'Rhffhr$0408',
    #     :enable_starttls_auto => true,
    # }

    # MailGun
    ActionMailer::Base.smtp_settings = {
        :address => 'smtp.eu.mailgun.org',
        :port => 587,
        # :authentication => 'plain',
        :user_name => 'postmaster@geminismart.it',
        :password => '253c6073926d453dd2e202addfb22add-6e0fd3a4-8abc0e9e',
        # :enable_starttls_auto => true,
    }
  end
end
