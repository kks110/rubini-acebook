require 'test_helper'

class PostsControllerTest < ActiveSupport::TestCase
  test "can calculate time since post" do
    created_at_time = Time.parse("2019-06-25 10:45:06 +0100")
    time_now = Time.parse("2019-06-25 10:45:58 +0100")
    assert PostsController.new.time_calculation(created_at_time, time_now) == "52 seconds ago"
  end

  test "should create a new post" do
     assert_difference('Post.count') do
       Post.create(body: 'rails', user_id: 1)
   end
  end

  test "should not create a new post" do
     assert_no_difference('Post.count') do
      Post.create(body: 'rails')
    end
  end

  test "can delete post" do
      assert_difference('Post.count', -1) do
      Post.destroy(1)
    end
  end

end
