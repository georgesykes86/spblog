require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid sign up information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { email: "",
                                          password: "somepass",
                                          password_confirmation: "somepass" }}
    end
    assert_template 'users/new'
  end

  test "valid sign up information" do
    get signup_path
    assert_difference 'User.count' do
      post users_path, params: { user: { email: "user@email.com",
                                          password: "somepass",
                                          password_confirmation: "somepass" }}
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end

end
