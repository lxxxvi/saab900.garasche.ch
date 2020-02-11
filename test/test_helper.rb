ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

require 'simplecov'
SimpleCov.start 'rails'

CarrierWave.configure do |config|
  config.enable_processing = false
  config.root = -> { Rails.root.join('tmp').to_s }
end

class ActiveSupport::TestCase
  parallelize(workers: :number_of_processors)
  fixtures :all
end

class ActionDispatch::IntegrationTest
  def sign_in_admin
    post admin_session_path, params: { password: 'admin' }
    follow_redirect!
    assert_response :success
  end
end
