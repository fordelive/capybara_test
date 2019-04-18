require 'capybara'
require 'dotenv/load'
require_relative 'auxiliaries'

Dir['./test_suites/tc_??.rb'].each {|file| require_relative file}

CLICK_TIMEOUT = 0 # pause before click on forms (for debug)
DRIVER = :selenium
TEST_URL = 'https://demoapp.strongqa.com'
OUTPUT_FILE = 'results.txt'.freeze

USER_LOGIN = ENV.fetch('LOGIN')
USER_PASSWORD = ENV.fetch('PASSWORD')

INCORRECT_LOGIN = 'blabla@mail.net'
INCORRECT_PASSWORD = '123456'

ON_LOGIN_FORM_CONDITION = "//h3[contains(text(),'Login form')]"

NOT_SIGNED_CONDITION = "//a[contains(text(),'Login')]"
SIGNEDIN_CONDITION = "//a[contains(text(),'Logout')]"

CANNOT_LOGIN_COND1 = "//span[@id='flash_alert']"
CANNOT_LOGIN_COND2 = "//span[@id='flash_alert']"

Capybara.default_selector = :xpath

File.delete(OUTPUT_FILE) if File.exists?(OUTPUT_FILE)

tc_01
tc_02
tc_03
tc_04
tc_05