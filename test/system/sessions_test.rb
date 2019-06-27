require "application_system_test_case"

class SessionsTest < ApplicationSystemTestCase

  test 'can log in and post' do
    visit login_url
    fill_in 'session[email]', with: 'ollie@makers.com'
    fill_in 'session[password]', with: 'HelloEverybody'
    click_button 'Log In'
    assert_text '+'
  end

  test 'can log out' do
    visit login_url
    fill_in 'session[email]', with: 'ollie@makers.com'
    fill_in 'session[password]', with: 'HelloEverybody'
    click_button 'Log In'
    click_on 'Log Out'
    assert_text 'Log In'
    expect(session[:user_id] == nil) 
  end

end
