source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'bootsnap', require: false
gem 'bugsnag'
gem 'carrierwave-aws'
gem 'cssbundling-rails'
gem 'haml-rails'
gem 'jsbundling-rails'
gem 'pagy'
gem 'pg', '>= 0.18'
gem 'puma'
gem 'rails'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'webdrivers'
end
