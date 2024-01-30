require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "show disabled by default" do
    get root_path
    assert_response :success
  end

  test "show after enabling demo" do
    Flipper.enable(:demo)

    get root_path
    assert_select "h1", text: /Welcome/
  end
end
