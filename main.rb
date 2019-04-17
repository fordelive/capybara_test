require 'capybara'
require 'dotenv/load'
require 'rspec/expectations'

include RSpec::Matchers

Dir['./test_suites/tc_??.rb'].each {|file| require_relative file}

CLICK_TIMEOUT = 0 # pause before click on forms (for debug)
DRIVER = :selenium
TEST_URL = 'https://demoapp.strongqa.com'
OUTPUT_FILE = 'results.txt'.freeze

USER_LOGIN = ENV.fetch('LOGIN')
USER_PASSWORD = ENV.fetch('PASSWORD')

INCORRECT_LOGIN = 'blabla@mail.net'
INCORRECT_PASSWORD = '123456'

def write_result(tc_name, result)
# variants of reporting strings:
# tc_01 (firefox): passed
# tc_01 (chrome): failed

  File.open(OUTPUT_FILE, 'a') {|f| f.puts"#{tc_name}: #{result}"}
end

def prepare_browser
  @session = Capybara::Session.new DRIVER
  @session.visit TEST_URL
  @session.current_window.maximize
end

Capybara.default_selector = :xpath
File.delete(OUTPUT_FILE) if File.exists?(OUTPUT_FILE)

tc_01
tc_02
tc_03
tc_04
tc_05