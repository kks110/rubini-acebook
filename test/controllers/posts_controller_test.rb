require 'test_helper'

class PostsControllerTest < ActiveSupport::TestCase
  test "can calculate time since post" do
    created_at_time = Time.parse("2019-06-25 10:45:06 +0100")
    time_now = Time.parse("2019-06-25 10:45:58 +0100")
    assert PostsController.new.time_calculation(created_at_time, time_now) == "52 seconds ago"
  end

end
