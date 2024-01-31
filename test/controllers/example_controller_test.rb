require "test_helper"

class ExampleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get example_index_url
    assert_response :success
  end

  test "should get show" do
    get example_show_url
    assert_response :success
  end
end
