Bugsnag.configure do |config|
  config.api_key = ENV.fetch('SAAB900_BUGSNAG_API_KEY', nil)
  config.notify_release_stages = %w[production]
end
