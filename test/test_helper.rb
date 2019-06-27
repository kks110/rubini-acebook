require 'simplecov'
# require 'capybara/rails'
# require 'minitest/rails/capybara'

SimpleCov.start 'rails' do
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/spec/'
  add_filter '/test/'
  add_filter '/app/channels'
  add_filter '/app/mailers'
  add_filter '/app/jobs'
end

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

if ENV["SLOW"].present?
  require "selenium-webdriver"
  module ::Selenium::WebDriver::Remote
    class Bridge
      alias old_execute execute

      def execute(*args)
        sleep(0.2)
        old_execute(*args)
      end
    end
  end
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
