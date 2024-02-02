require "test_helper"

class ExampleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get examples_url
    assert_response :success
  end

  test "should get show" do
    get example_url(slug: 'circuit-breakers')
    assert_response :success
  end
end
