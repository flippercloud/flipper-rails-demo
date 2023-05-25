require "test_helper"

class FeaturesControllerTest < ActionDispatch::IntegrationTest
  test "posting valid feature to create endpoint enables it" do
    post enable_url(feature: :demo)
    assert_redirected_to root_path
  end

  test "deleting valid feature to destroy endpoint disables it" do
    delete disable_url(feature: :demo)
    assert_redirected_to root_path
  end

  test "posting valid feature to create with user true enables it for current user" do
    post enable_path(feature: :demo, user: true)
    assert_redirected_to root_path
  end

  test "deleting valid feature to destroy with user true disbles it for current user" do
    delete disable_path(feature: :demo, user: true)
    assert_redirected_to root_path
  end

  test "posting valid feature to create with group enables it for group" do
    post enable_path(feature: :demo, group: :coffee_drinkers)
    assert_redirected_to root_path
  end

  test "deleting valid feature to destroy with group disable it for group" do
    delete disable_path(feature: :demo, group: :coffee_drinkers)
    assert_redirected_to root_path
  end

  test "posting valid feature to create with percentage enables it for that percentage" do
    post enable_path(feature: :demo, percentage: 25)
    assert_redirected_to root_path
  end

  test "deleting valid feature to dstroy with percentage reduces percentage to 0" do
    delete disable_path(feature: :demo, percentage: 0)
    assert_redirected_to root_path
  end
end
