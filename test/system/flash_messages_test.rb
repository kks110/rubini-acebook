require "application_system_test_case"

class FlashMessagesTest < ApplicationSystemTestCase

  test 'success message on post creation' do
    visit login_url
    fill_in 'session[email]', with: 'ollie@makers.com'
    fill_in 'session[password]', with: 'HelloEverybody'
    click_on 'Save Session'
    visit new_post_url
    body = 'Hello!'
    fill_in 'post[body]', with: body
    click_on 'Create Post'
    assert_text "Your post has been added"
  end

  test 'error at sign up' do
    visit signup_url
    fill_in 'user[username]', with: 'Ollie'
    fill_in 'user[email]', with: 'ollie@makers.com'
    fill_in 'user[password]', with: 'HelloEverybody'
    click_on 'Create User'
    assert_text 'Username has already been taken'
  end

  test 'success message for new user sign up' do
    visit signup_url
    fill_in 'user[username]', with: 'Kelvin'
    fill_in 'user[email]', with: 'kelvin@makers.com'
    fill_in 'user[password]', with: 'HelloEverybody'
    click_on 'Create User'
    assert_text 'Welcome kelvin'
  end

  test 'success at log in' do
    visit login_url
    fill_in 'session[email]', with: 'ollie@makers.com'
    fill_in 'session[password]', with: 'HelloEverybody'
    click_on 'Save Session'
    assert_text 'Welcome Ollie'
  end

  test 'error on log in' do
    visit login_url
    fill_in 'session[email]', with: 'ollie@makers.com'
    fill_in 'session[password]', with: 'HelloE'
    click_on 'Save Session'
    assert_text "Incorrect details. Please try again."
  end

  test 'success on post deletion' do
    visit login_url
    fill_in 'session[email]', with: 'ollie@makers.com'
    fill_in 'session[password]', with: 'HelloEverybody'
    click_on 'Save Session'
    visit posts_url
    assert_text 'Post1'
    click_link('Delete', :match => :first)
    page.driver.browser.switch_to.alert.accept
    assert_text "Your post has been deleted"
  end

  test 'failure error on delete post' do
    visit login_url
    fill_in 'session[email]', with: 'jayda@makers.com'
    fill_in 'session[password]', with: 'HiEveryone'
    click_on 'Save Session'
    visit posts_url
    assert_text 'Post1'
    click_link('Delete', :match => :first)
    page.driver.browser.switch_to.alert.accept
    assert_text "Hands off! This is not your post."
  end

  test 'success on post update' do
      visit login_url
      fill_in 'session[email]', with: 'ollie@makers.com'
      fill_in 'session[password]', with: 'HelloEverybody'
      click_on 'Save Session'
      visit posts_url
      assert_text 'Post1'
      click_link('Update', :match => :first)
      fill_in 'post[body]', with: 'Test update'
      click_on 'Update Post'
      assert_text "Your post has been updated"
  end

  test 'failure error on post update' do
    visit login_url
    fill_in 'session[email]', with: 'jayda@makers.com'
    fill_in 'session[password]', with: 'HiEveryone'
    click_on 'Save Session'
    visit posts_url
    assert_text 'Post1'
    click_link('Update', :match => :first)
    assert_text "Hands off! This is not your post."
  end

  test 'failure error on post creation' do
    visit login_url
    fill_in 'session[email]', with: 'ollie@makers.com'
    fill_in 'session[password]', with: 'HelloEverybody'
    click_on 'Save Session'
    visit new_post_url
    body = 'H'
    fill_in 'post[body]', with: body
    click_on 'Create Post'
    assert_text "Body is too short (minimum is 2 characters)"
  end

  test 'success on log out' do
    visit login_url
    fill_in 'session[email]', with: 'ollie@makers.com'
    fill_in 'session[password]', with: 'HelloEverybody'
    click_on 'Save Session'
    click_on 'Log Out'
    assert_text "You've logged out!"
  end
end
