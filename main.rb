require 'capybara'
require 'capybara/dsl'
require 'dotenv/load'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec/expectations'

include RSpec::Matchers


require_relative 'auxiliaries'
log_event __method__, '===== APPLICATION STARTED ====='
require_relative './classes/web_page'

# loading spec then classes
Dir['./spec/*.rb'].each {|file| require_relative file}
Dir['./classes/*.rb'].each {|file| require_relative file}

CLICK_TIMEOUT = 0 # pause before click on forms (for debug)
DRIVER = :selenium
TEST_URL = 'https://demoapp.strongqa.com'.freeze

USER_LOGIN = ENV.fetch('LOGIN')
USER_PASSWORD = ENV.fetch('PASSWORD')

INCORRECT_LOGIN = 'blabla@mail.net'.freeze
INCORRECT_PASSWORD = '123456'.freeze

ON_LOGIN_FORM_CONDITION = '//h3[contains(text(),\'Login form\')]'.freeze

MSG_PAGE_INACCESSIBLE = 'Page cannot be accessed!!! Aborting.'.freeze
MSG_STARTING_TEST = 'Starting test case'
MSG_FINISHING_TEST = 'Test case:'

Capybara.default_selector = :xpath
Capybara.current_driver = DRIVER
Capybara.app_host = TEST_URL

File.delete(RESULT_FILE) if File.exists?(RESULT_FILE)

test_suit = TestSuit.new

test_suit.public_methods.sort!.each do |method|
  test_suit.send(method) if method.to_s.start_with?('tc_')# &&  method.to_s == 'tc_04'
  end