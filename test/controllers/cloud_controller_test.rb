require "test_helper"

class CloudControllerTest < ActionDispatch::IntegrationTest
  test "connect with valid token" do
    stub_request(:get, "https://www.flippercloud.io/adapter/features?exclude_gate_names=true").
      to_return(status: 200, body: '{"features": {}}')

    get cloud_connect_url("valid personal token")
    assert_redirected_to root_url
  end

  test "connect with invalid token" do
    stub_request(:get, "https://www.flippercloud.io/adapter/features?exclude_gate_names=true").
      to_return(status: 401, body: '{"error": "invalid token"}')

    get cloud_connect_url('invalid')
    assert_response 406
    assert_select '*', text: /invalid/i
  end
end
