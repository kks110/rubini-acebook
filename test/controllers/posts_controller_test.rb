require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new post" do
    get new_post_url
    assert_response :success
  end
  test "should get edit post" do
    get edit_post_url
    assert_response :success
  end
  test "should get posts" do
    get posts_url
    assert_response :success
  end
  test "should show individual post" do
    get post_url
    assert_response :success
  end
end
