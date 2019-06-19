require 'test_helper'
require 'application_system_test_case'

class PostFlowTest < ApplicationSystemTestCase

    test 'can delete a post' do
      visit posts_url
      assert_text 'Post1'
      click_link('Delete', :match => :first)
      page.driver.browser.switch_to.alert.accept
      refute_text 'Post1'
    end

end
