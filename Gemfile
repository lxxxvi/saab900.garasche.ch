source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'bugsnag'
gem 'carrierwave-aws'
gem 'haml-rails'
gem 'pagy'
gem 'pg', '>= 0.18'
gem 'puma'
gem 'rails'
gem 'webpacker'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
end

group :development do
  gem 'listen'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
