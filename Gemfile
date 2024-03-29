source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "bootsnap", require: false
gem "bugsnag"
gem "carrierwave-aws"
gem "haml-rails"
gem "importmap-rails"
gem "pagy"
gem "pg"
gem "propshaft"
gem "puma"
gem "rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "debug"
  gem "rubocop", require: false
  gem "rubocop-capybara", require: false
  gem "rubocop-rails", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "webdrivers"
end
