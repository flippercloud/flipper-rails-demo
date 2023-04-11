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
      password: "password",
    }
    post log_in_url
    assert_redirected_to root_path
  end

  test "should get destroy" do
    delete log_out_url
    assert_redirected_to login_path
  end
end
