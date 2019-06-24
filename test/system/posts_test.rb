require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase

  test 'can add a new post' do
    visit login_url
    fill_in 'session[email]', with: 'ollie@makers.com'
    fill_in 'session[password]', with: 'HelloEverybody'
    click_on 'Save Session'
    visit new_post_url
    body = 'Hello!'
    fill_in 'post[body]', with: body
    click_on 'Create Post'
    assert_text body
  end

  test 'can delete a post' do
    visit login_url
    fill_in 'session[email]', with: 'ollie@makers.com'
    fill_in 'session[password]', with: 'HelloEverybody'
    click_on 'Save Session'
    visit posts_url
    assert_text 'Post1'
    click_link('Delete', :match => :first)
    page.driver.browser.switch_to.alert.accept
    refute_text 'Post1'
  end

  test 'can only delete own post' do
    visit login_url
    fill_in 'session[email]', with: 'jayda@makers.com'
    fill_in 'session[password]', with: 'HiEveryone'
    click_on 'Save Session'
    visit posts_url
    assert_text 'Post1'
    click_link('Delete', :match => :first)
    page.driver.browser.switch_to.alert.accept
    assert_text 'Post1'
  end

  test 'can only update own post' do
    visit login_url
    fill_in 'session[email]', with: 'jayda@makers.com'
    fill_in 'session[password]', with: 'HiEveryone'
    click_on 'Save Session'
    visit posts_url
    assert_text 'Post1'
    click_link('Update', :match => :first)
    assert_text 'Post1'
  end

  test 'can update a post' do
    visit login_url
    fill_in 'session[email]', with: 'ollie@makers.com'
    fill_in 'session[password]', with: 'HelloEverybody'
    click_on 'Save Session'
    visit posts_url
    assert_text 'Post1'
    click_link('Update', :match => :first)
    fill_in 'post[body]', with: 'Test update'
    click_on 'Update Post'
    assert_text 'Test update'
  end

end
