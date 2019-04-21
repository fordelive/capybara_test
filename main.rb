require 'capybara'
require 'capybara/dsl'
require 'dotenv/load'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec/expectations'

include RSpec::Matchers


require_relative 'auxiliaries'
log_event __method__, '===== APPLICATION STARTED ====='

# loading modules then classes
Dir['./modules/*.rb'].each {|file| require_relative file}
Dir['./classes/*.rb'].each {|file| require_relative file}


CLICK_TIMEOUT = 0 # pause before click on forms (for debug)
DRIVER = :selenium
TEST_URL = 'https://demoapp.strongqa.com'.freeze

USER_LOGIN = ENV.fetch('LOGIN')
USER_PASSWORD = ENV.fetch('PASSWORD')

INCORRECT_LOGIN = 'blabla@mail.net'.freeze
INCORRECT_PASSWORD = '123456'.freeze

ON_LOGIN_FORM_CONDITION = '//h3[contains(text(),\'Login form\')]'.freeze

NOT_SIGNED_CONDITION = '//a[contains(text(),\'Login\')]'.freeze
SIGNEDIN_CONDITION = '//a[contains(text(),\'Logout\')]'.freeze

CANNOT_LOGIN_COND1 = '//span[@id=\'flash_alert\']'.freeze
CANNOT_LOGIN_COND2 = '//span[@id=\'flash_alert\']'.freeze

MSG_PAGE_INACCESSIBLE = 'Page cannot be accessed!!! Aborting.'.freeze


Capybara.default_selector = :xpath
Capybara.current_driver = DRIVER
Capybara.app_host = TEST_URL

File.delete(RESULT_FILE) if File.exists?(RESULT_FILE)

test_suit = TestSuite.new

test_suit.public_methods.sort!.each do |method|
  test_suit.send(method) if method.to_s.start_with?('tc_')# &&  method.to_s == 'tc_03'
  end