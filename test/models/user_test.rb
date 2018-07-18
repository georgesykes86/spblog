require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: "george@email.com", password: "georgeyporgey")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "should not be valid if email not present" do
    @user.email = nil
    assert !@user.valid?
  end

  test "should not be valid if no password" do
    @user.password = nil
    assert !@user.valid?
  end

  test "should not be valid if not a proper email" do
    @user.email = "georgesykes"
    assert !@user.valid?
  end

  test "should not be valid if not the correct length password" do
    @user.password = "pass"
    assert !@user.valid?
  end

end
