# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise', '~> 4.7'
gem 'jbuilder', '~> 2.7'
gem 'omniauth-google-oauth2'
gem 'pg', '~> 1.2'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 4.0.0'
  gem 'rubocop', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'capybara-screenshot'
  gem 'database_cleaner-active_record'
  gem 'email_spec', '~> 2.2'
  gem 'factory_bot_rails', '~> 5.1'
  gem 'ffaker', '~> 2.14'
  gem 'minitest-matchers', '~> 1.4'
  gem 'pry'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'webdrivers'
end
