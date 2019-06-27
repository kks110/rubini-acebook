require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should go to sign up" do
    get signup_url
    assert_response :success
  end
  test "should go to log in" do
    get login_url
    assert_response :success
  end
  test "it can start a new session" do
    
  end
end
