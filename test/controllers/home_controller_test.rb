require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "show with foo enabled" do
    Flipper.enable(:foo)
    get root_path
    assert_select "p", text: /enabled/
  end

  test "show without foo enabled" do
    get root_path
    assert_select "p", text: /disabled/
  end
end
