require "application_system_test_case"

class LikesTest < ApplicationSystemTestCase

  test 'user can like a post' do
    visit login_url
    fill_in 'session[email]', with: 'ollie@makers.com'
    fill_in 'session[password]', with: 'HelloEverybody'
    click_button 'Log In'
    click_on 'Ollie'
    click_link('👍', :match => :first)
    assert_text '👍 1'
  end

  test 'user can unlike a post' do
    visit login_url
    fill_in 'session[email]', with: 'ollie@makers.com'
    fill_in 'session[password]', with: 'HelloEverybody'
    click_button 'Log In'
    click_on 'Ollie'
    click_link('👍', :match => :first)
    click_link('👍', :match => :first)
    refute_text '👍 1'
  end

end
