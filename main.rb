require 'capybara'
require 'capybara/dsl'
require 'dotenv/load'
require 'selenium-webdriver'
require 'site_prism'

require_relative 'auxiliaries'

# loading classes
Dir['./classes/*.rb'].each {|file| require_relative file}
Dir['./modules/*.rb'].each {|file| require_relative file}

log_event __method__, '===== APPLICATION STARTED ====='

ON_LOGIN_FORM_CONDITION = '//h3[contains(text(),\'Login form\')]'

CLICK_TIMEOUT = 0 # pause before click on forms (for debug)
DRIVER = :selenium
TEST_URL = 'https://demoapp.strongqa.com'

Capybara.default_selector = :xpath

File.delete(RESULT_FILE) if File.exists?(RESULT_FILE)

Capybara.current_driver = DRIVER
Capybara.app_host = TEST_URL

test_suit = TestSuite.new

test_suit.public_methods(false).sort!.each do |method|
  puts test_suit.send(method) if method.to_s.start_with?("test_case_")
  end