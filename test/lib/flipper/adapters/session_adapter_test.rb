require 'test_helper'
require 'flipper/test/shared_adapter_test'
require 'flipper/adapters/session'

class FlipperSessionAdapterTest < ActiveSupport::TestCase
  prepend Flipper::Test::SharedAdapterTests

  setup do
    @session = {}
    @adapter = Flipper::Adapters::Session.new(@session)
  end

  test "initializes session with empty hash" do
    assert_equal({ flipper_features: {} }, @session)
  end

  test "enable stores feature in session" do
    assert_equal true, @adapter.enable(@feature, @boolean_gate, Flipper::Types::Boolean.new)
    assert_equal "true", @session[:flipper_features][@feature.key][:boolean]
  end

  # def teardown
  #   # Any code here will run after each test
  # end
end
