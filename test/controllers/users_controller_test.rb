require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get sign up page" do
    get signup_url
    assert_response :success
  end

  test "should get log in page" do
    get login_url
    assert_response :success
  end

  test "should create a new user" do
    assert_difference('User.count') do
    post users_url, params: { user: { username: 'rails', email: 'rails@rails.rails', password: 'railsrails' } }
  end
  end

  test "should not create a new user" do
    assert_no_difference('User.count') do
    post users_url, params: { user: { username: 'rails', email: 'ollie@makers.com', password: 'railsrails' } }
  end
  end

  # test "should delete a user" do
  #   user = User.new
  #   user.count
  #   assert_difference('User.count') do
  #   delete user_url, params: { :id => 1 }
  # end
  # end



end
