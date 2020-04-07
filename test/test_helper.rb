# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'ffaker'
require 'minitest-matchers'
require 'email_spec'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  # parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all
  include FactoryBot::Syntax::Methods

  # Add more helper methods to be used by all tests here...
  include Devise::Test::IntegrationHelpers

  include EmailSpec::Helpers
  include EmailSpec::Matchers
end
