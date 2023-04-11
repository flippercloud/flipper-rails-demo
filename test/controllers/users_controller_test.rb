require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should redirect to root after registration" do
    params = {
      user: {
        email: "test@example.com",
        password: "password",
        password_confirmation: "password"
      }
    }
    post users_url, params: params
    assert_redirected_to root_path
  end
end
