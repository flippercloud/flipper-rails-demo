require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      email: "user@example.com",
      password: 'p@55w0rd'
    )
  end

  test "requires email" do
    assert @user.valid?, @user.errors.full_messages

    @user.email = nil
    refute @user.valid?, @user.errors.full_messages
    assert @user.errors[:email].any?
  end

  test "requires unique email" do
    @user.save!

    duplicate_email = User.new(
      email: @user.email,
      password: 'password'
    )

    refute duplicate_email.valid?, duplicate_email.errors.full_messages
    assert duplicate_email.errors[:email].any?
  end

  test "requires password confirmation" do
    @user.password_confirmation = 'not the same'

    refute @user.valid?, @user.errors.full_messages
    assert @user.errors[:password_confirmation].any?
  end
end
