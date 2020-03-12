require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require 'support/capybara'
require 'support/geocoder'
require 'support/feature_flags'
require 'support/session_helper'
require 'support/semantic_logger_helper'
require 'simplecov'
require 'vcr'
require 'notifications/client'
require 'webmock/rspec'
require 'semantic_logger'
SimpleCov.start

VCR.configure do |vcr|
  vcr.cassette_library_dir = 'spec/fixtures/vcr'
  vcr.hook_into :webmock
  vcr.ignore_localhost = true
  vcr.configure_rspec_metadata!
  vcr.allow_http_connections_when_no_cassette = true
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include FactoryBot::Syntax::Methods

  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
