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

end
