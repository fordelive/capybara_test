require 'bundler/setup'
Bundler.require :test

require_relative '../../classes/web_page'
require_relative '../../classes/home_page'
require_relative '../../classes/login_page'

Capybara.configure do |config|
  config.default_driver = :selenium
  config.default_selector = :css
  config.app_host = 'http://demoapp.strongqa.com/'
end