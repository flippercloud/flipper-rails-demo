require "test_helper"

class DemoControllerTest < ActionDispatch::IntegrationTest
  test "should get basic" do
    get demo_basic_url
    assert_response :success
  end

  test "should get actor" do
    get demo_actor_url
    assert_response :success
  end

  test "should get group" do
    get demo_group_url
    assert_response :success
  end

  test "should get percentage" do
    get demo_percentage_url
    assert_response :success
  end
end
