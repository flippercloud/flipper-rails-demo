require "test_helper"

class DemoControllerTest < ActionDispatch::IntegrationTest
  test "should get demo welcome page" do
  end

  test "should get actor demo page" do
    get demo_actor_url
    assert_response :success
  end

  test "should get group demo page" do
    get demo_group_url
    assert_response :success
  end

  test "should get percentage demo page" do
    get demo_percentage_url
    assert_response :success
  end
end
