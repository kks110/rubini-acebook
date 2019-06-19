require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase

  test 'can add a new user by sign up' do
    visit signup_url
    fill_in 'user[username]', with: 'Jayda'
    fill_in 'user[email]', with: 'jayda@makers.com'
    fill_in 'user[password]', with: 'HelloWorld'
    click_on 'Create User'
    assert_text 'Jayda'
  end

  test 'can log in' do
    visit login_url
    fill_in 'user[email]', with: 'ollie@makers.com'
    fill_in 'user[password]', with: 'HelloEverybody'
    click_on 'Login'
    assert_text 'Ollie'
  end

end
