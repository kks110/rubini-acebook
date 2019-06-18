require 'test_helper'
require 'application_system_test_case'

class PostFlowTest < ApplicationSystemTestCase

    test 'can add a new post' do
      visit new_post_url
      body = 'Hello!'
      fill_in 'post[body]', with: body
      click_on 'Save Post'
      assert_text body
    end

end
