require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase

  test 'can add a new user by sign up' do
    visit signup_url
    fill_in 'user[username]', with: 'Kelvin'
    fill_in 'user[email]', with: 'kelvin@makers.com'
    fill_in 'user[password]', with: 'HelloWorld'
    click_on 'Sign Up'
    assert_text 'kelvin'
  end

  test 'can log in' do
    visit login_url
    fill_in 'session[email]', with: 'ollie@makers.com'
    fill_in 'session[password]', with: 'HelloEverybody'
    click_button 'Log In'
    assert_text 'Ollie'
  end


end
