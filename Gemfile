# frozen_string_literal: true
source 'https://rubygems.org' do
  gem 'active_hash'
  gem 'activerecord-postgis-adapter', '~> 4.0.0.rc'
  gem 'dotenv-rails'
  gem 'oga'
  gem 'pg', '~> 0.18'
  gem 'puma'
  gem 'rails', '>= 5.0.0.rc2', '< 5.1'
  gem 'rake'
  gem 'rgeo-geojson'
  gem 'slim-rails'
  gem 'virtus'

  group :development, :test do
    gem 'factory_girl_rails'
    gem 'simplecov', require: false
  end

  group :test do
    gem 'database_rewinder'
    gem 'ffaker'
    gem 'rspec-rails', '>=3.5.0.beta4'
    gem 'rspec-request_describer'
    gem 'rspec_junit_formatter'
    gem 'validation_examples_matcher'
  end

  group :development do
    gem 'byebug', platform: :mri
    gem 'listen'
    gem 'pre-commit', require: false
    gem 'pry-byebug'
    gem 'pry-rails'
    gem 'rubocop', require: false
    gem 'web-console'
  end
end
