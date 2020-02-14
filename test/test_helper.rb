ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

CarrierWave.configure do |config|
  config.enable_processing = false
  config.root = -> { Rails.root.join('tmp').to_s }
end

class ActiveSupport::TestCase
  parallelize(workers: :number_of_processors)
  fixtures :all

  def upload_file(file, expected_difference = 1)
    assert_difference -> { Upload.count }, expected_difference do
      post uploads_path, params: { upload: { file: file } }
    end
  end
end

class ActionDispatch::IntegrationTest
  def sign_in_admin
    post admin_session_path, params: { password: 'admin' }
    follow_redirect!
    assert_response :success
  end
end
