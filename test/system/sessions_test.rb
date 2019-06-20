require "application_system_test_case"

class SessionsTest < ApplicationSystemTestCase

  test 'can log in and post' do
    visit login_url
    fill_in 'session[email]', with: 'ollie@makers.com'
    fill_in 'session[password]', with: 'HelloEverybody'
    click_on 'Save Session'
    assert_text 'New post'
  end

  test 'can log out' do
    visit login_url
    fill_in 'session[email]', with: 'ollie@makers.com'
    fill_in 'session[password]', with: 'HelloEverybody'
    click_on 'Save Session'
    click_on 'Log Out'
    assert_text 'Login Here'
  end

end
