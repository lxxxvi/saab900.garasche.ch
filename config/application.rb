require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
# require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require 'action_view/railtie'
# require "action_cable/engine"
require 'sprockets/railtie'
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Saab900GarascheCh
  class Application < Rails::Application
    config.i18n.available_locales = :de
    config.i18n.default_locale = :de
    config.load_defaults 7.0
    config.action_view.form_with_generates_remote_forms = false
    config.admin_password = ENV.fetch('SAAB900_ADMIN_PASSWORD')
    config.carrierwave_storage = :file # production and development_aws use :aws
  end
end
