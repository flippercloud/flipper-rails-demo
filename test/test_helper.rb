require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "support/test_password_helper"

# Override Flipper Cloud configuration for tests
Flipper.configure do |config|
  config.default { Flipper.new(Flipper::Adapters::Memory.new) }
end

class ActiveSupport::TestCase
  include TestPasswordHelper
  ActiveRecord::FixtureSet.context_class.send :include, TestPasswordHelper

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  setup do
    Flipper.instance = nil # Reset previous flipper instance
  end
end
