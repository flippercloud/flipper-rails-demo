require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

# Override Flipper Cloud configuration for tests
# Read more about testing with Flipper Cloud:
#   https://www.flippercloud.io/docs/testing#starting-fresh
Flipper.configure do |config|
  config.default { Flipper.new(Flipper::Adapters::Memory.new) }
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  setup do
    Flipper.instance = nil # Reset previous flipper instance
  end
end
