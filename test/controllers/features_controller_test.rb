require "test_helper"

class FeaturesControllerTest < ActionDispatch::IntegrationTest
  test "posting valid feature to create enables" do
    post enable_url(:foo)
    assert_redirected_to root_path
  end

  test "deleting valid feature to destroy disables" do
    delete disable_url(:foo)
    assert_redirected_to root_path
  end
end
