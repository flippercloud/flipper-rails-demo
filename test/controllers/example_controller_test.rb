require "test_helper"

class ExampleControllerTest < ActionDispatch::IntegrationTest
  test "gets index" do
    get examples_url
    assert_response :success
  end

  test "gets show" do
    get example_url(slug: 'circuit-breakers')
    assert_response :success
  end

  test "loads all examples" do
    Example.list.each do |ex|
      get example_url(slug: ex.slug)
      assert_response :success
    end
  end

end
