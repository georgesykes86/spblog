require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: "george@email.com", password: 'foobar', password_confirmation: 'foobar')
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "should not be valid if email not present" do
    @user.email = nil
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

  test "email should not be too long" do
    @user.email = "a" * 100 + "@example.com"
    assert_not @user.valid?
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses are saved as lower case" do
    mixed_case_email_address = "Foo@ExaMpLe.coM"
    @user.email = mixed_case_email_address
    @user.save
    assert_equal mixed_case_email_address.downcase, @user.reload.email
  end

  test "user not valid without password" do
    @user.password = nil
    assert_not @user.valid?
  end

  test "user not valid without password confirmation" do
    @user.password_confirmation = "notfoobar"
    assert_not @user.valid?
  end

  test "password should not be blank" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password must be more than a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "authenticated? should return false for a usesr with nil digest" do
    assert_not @user.authenticated?('')
  end

end
