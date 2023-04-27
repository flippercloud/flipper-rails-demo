require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "shows welcome without authentication" do
    get root_path
    assert_select "p", text: /Welcome to the Flipper Rails demo application/
  end

  test "show disabled by default" do
    user = users(:basic)
    params = {
      email: user.email,
      password: default_password,
    }
    post log_in_url(params: params)

    get root_path
    assert_select "del", text: /disabled/
  end

  test "show after enabling demo" do
    Flipper.enable(:demo)

    user = users(:basic)
    params = {
      email: user.email,
      password: default_password,
    }
    post log_in_url(params: params)

    get root_path
    assert_select "ins", text: /enabled/
  end
end
