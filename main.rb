require 'capybara'
require 'capybara/dsl'
require 'dotenv/load'
require 'selenium-webdriver'
require 'site_prism'

require_relative 'auxiliaries'
log_event __method__, '===== APPLICATION STARTED ====='

# loading classes and modules
Dir['./classes/*.rb'].each {|file| require_relative file}
Dir['./modules/*.rb'].each {|file| require_relative file}

CLICK_TIMEOUT = 5 # pause before click on forms (for debug)
DRIVER = :selenium
TEST_URL = 'https://demoapp.strongqa.com'

USER_LOGIN = ENV.fetch('LOGIN')
USER_PASSWORD = ENV.fetch('PASSWORD')

INCORRECT_LOGIN = 'blabla@mail.net'
INCORRECT_PASSWORD = '123456'

ON_LOGIN_FORM_CONDITION = '//h3[contains(text(),\'Login form\')]'

NOT_SIGNED_CONDITION = "//a[contains(text(),'Login')]"
SIGNEDIN_CONDITION = "//a[contains(text(),'Logout')]"

CANNOT_LOGIN_COND1 = "//span[@id='flash_alert']"
CANNOT_LOGIN_COND2 = "//span[@id='flash_alert']"

MSG_PAGE_INACCESSIBLE = 'Page cannot be accessed!!! Aborting.'


Capybara.default_selector = :xpath

File.delete(RESULT_FILE) if File.exists?(RESULT_FILE)

Capybara.current_driver = DRIVER
Capybara.app_host = TEST_URL

test_suit = TestSuite.new

test_suit.public_methods(false).sort!.each do |method|
  puts test_suit.send(method) if method.to_s.start_with?("test_case_") # &&  method.to_s == 'test_case_02'
  end