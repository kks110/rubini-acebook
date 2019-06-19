require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase

  test 'can add a new post' do
    visit new_post_url
    body = 'Hello!'
    fill_in 'post[body]', with: body
    click_on 'Create Post'
    assert_text body
  end

  test 'can delete a post' do
    visit posts_url
    assert_text 'Post1'
    click_link('Delete', :match => :first)
    page.driver.browser.switch_to.alert.accept
    refute_text 'Post1'
  end

end
