require "test_helper"

class DemoControllerTest < ActionDispatch::IntegrationTest
  test "resets demo" do
    Flipper.enable(:demo)
    Flipper.enable_percentage_of_actors(:slow_roll, 25)
    post demo_reset_url

    assert_not Flipper.enabled?(:demo)
    assert_not Flipper.enabled?(:slow_roll)
    assert_redirected_to demo_start_url
  end

  test "get demo welcome page" do
    get demo_start_url
    assert_response :success
  end

  test "get actor demo page" do
    get demo_actor_url
    assert_response :success
  end

  test "get group demo page" do
    get demo_group_url
    assert_response :success
  end

  # test "get percentage demo page" do
  #   get demo_percentage_url
  #   assert_response :success
  # end
end
