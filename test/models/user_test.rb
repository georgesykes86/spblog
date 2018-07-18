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
    assert_not @user.valid?
  end

  test "should not be valid if no password" do
    @user.password = nil
    assert_not @user.valid?
  end

  test "should not be valid if not a proper email" do
    invalid_addresses = %w[user@example,com USER@something.@ A_USER.NEW@foo.bar.
                           first@user_cn john@gemr+any.e]
    invalid_addresses.each do |address|
      @user.email = address
      assert_not @user.valid?, "#{address.inspect} should not be valid"
    end
  end

  test "should be valid if using a proper email" do
    valid_addresses = %w[user@example.com USER@something.com A_USER-NEW@foo.bar.org
                           first@user.cn john@gemrany.de]
    valid_addresses.each do |address|
      @user.email = address
      assert @user.valid?, "#{address.inspect} should be valid"
    end
  end

  test "password should not be too short" do
    @user.password = "pass"
    assert_not @user.valid?
  end

  test "password should not be too long" do
    @user.password = "p" * 16
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 100 + "@example.com"
    assert_not @user.valid?
  end

end
