require "test_helper"

class ExampleTest < ActiveSupport::TestCase
  setup do
    @example = Example.new(
      title: "Example Title",
      desc: "Example Description",
      icon: "check",
      tags: [[:permanent, :success], [:internal, :secondary]]
    )
  end

  test "auto-generates a flag symbol without a custom_flag" do
    assert_equal :example_title, @example.flag
  end

  test "prefers custom_flag symbol when provided" do
    @example.custom_flag = :example
    assert_equal :example, @example.flag
  end

  test "creates slug from title" do
    assert_equal 'example-title', @example.slug
  end

  test "knows if the corresponding partial exists" do
    assert_not @example.exists?

    @example.title = "Circuit Breakers"
    assert @example.exists?
  end
end
