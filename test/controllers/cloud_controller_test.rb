require "test_helper"

class CloudControllerTest < ActionDispatch::IntegrationTest
  test "connect with valid token" do
    token = "valid personal token"
    stub_request(:get, "https://www.flippercloud.io/adapter/features?exclude_gate_names=true").
      with(headers: { 'Flipper-Cloud-Token' => token }).
      to_return(status: 200, body: '{"features": {}}')

    get cloud_connect_url(EncryptedToken.encrypt(token))
    assert_redirected_to root_url
  end

  test "connect with expired token" do
    get cloud_connect_url(EncryptedToken.encrypt('invalid', expires_at: 1.second.ago))
    assert_response 406
    assert_select '*', text: /invalid/i
  end

  test "connect with invalid token" do
    token = 'invalid'
    stub_request(:get, "https://www.flippercloud.io/adapter/features?exclude_gate_names=true").
      with(headers: { 'Flipper-Cloud-Token' => token }).
      to_return(status: 401, body: '{"error": "invalid token"}')

    get cloud_connect_url(EncryptedToken.encrypt(token))
    assert_response 406
    assert_select '*', text: /invalid/i
  end
end
