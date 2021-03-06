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

  test 'can delete account' do
    visit login_url
    fill_in 'session[email]', with: 'ollie@makers.com'
    fill_in 'session[password]', with: 'HelloEverybody'
    click_button 'Log In'
    click_on 'Ollie'
    click_on 'Delete Account'
    page.driver.browser.switch_to.alert.accept
    fill_in 'session[email]', with: 'ollie@makers.com'
    fill_in 'session[password]', with: 'HelloEverybody'
    click_button 'Log In'
    assert_text 'Incorrect details. Please try again.'
  end

  test 'can update user details' do
    visit login_url
    fill_in 'session[email]', with: 'ollie@makers.com'
    fill_in 'session[password]', with: 'HelloEverybody'
    click_button 'Log In'
    click_on 'Ollie'
    click_on 'Update Account'
    fill_in 'user[username]', with: 'Kelvin'
    fill_in 'user[password]', with: 'HelloWorld2'
    click_on 'Confirm'
    click_on 'Log Out'
    fill_in 'session[email]', with: 'ollie@makers.com'
    fill_in 'session[password]', with: 'HelloWorld2'
    click_button 'Log In'
    assert_text 'kelvin'
  end

  test 'can get error when updating user details' do
    visit login_url
    fill_in 'session[email]', with: 'ollie@makers.com'
    fill_in 'session[password]', with: 'HelloEverybody'
    click_button 'Log In'
    click_on 'Ollie'
    click_on 'Update Account'
    fill_in 'user[username]', with: 'Kelvin'
    fill_in 'user[password]', with: 'He'
    click_on 'Confirm'
    assert_text 'Please try again'

  end

end
