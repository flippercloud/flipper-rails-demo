require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_url
    assert_response :success
  end

  test "should get create" do
    user = users(:basic)
    params = {
      email: user.email,
      password: default_password,
    }
    post log_in_url(params: params)
    assert_redirected_to root_path
  end

  test "should log out via destroy" do
    delete log_out_url
    assert_redirected_to root_path
  end
end
