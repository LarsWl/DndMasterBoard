# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'acts_as_list'
gem 'webpacker'
gem 'mini_magick'
gem 'image_processing', '~> 1.2'
gem 'annotate'
gem 'awesome_nested_set'
gem 'dry-validation'
gem 'draper'
gem 'devise'
gem 'hotwire-rails'
gem 'jbuilder', '~> 2.7'
gem 'redis-rails'
gem 'pg', '~> 1.1'
gem 'pg_search'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.0'
gem 'sass-rails', '>= 6'
gem 'scrypt'
gem 'rexml'

gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails'
  gem 'rails-controller-testing'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  # gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'brakeman'
end

group :test do
  gem 'database_cleaner-active_record'
  gem 'database_cleaner-redis'
  gem 'database_cleaner-sequel'
  gem 'capybara', '>= 3.26'
  gem 'factory_bot_rails'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'simplecov'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
