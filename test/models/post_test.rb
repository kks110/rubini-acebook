require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @post = Post.new(body: "sports")
  end

  test 'category should be vaild' do
    assert @post.valid?
  end

  test 'name should be present' do
    @post.body = ' '
    assert_not @post.valid?
  end

  test 'name should not be too long' do
    @post.body = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    assert_not @post.valid?
  end

  test 'name should not be too short' do
    @post.body = "a"
    assert_not @post.valid?
  end

end
