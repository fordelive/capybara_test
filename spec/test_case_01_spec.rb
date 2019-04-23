# Description:
#     User can open login page via menu
# STR:
#   1. Navigate to Home page as User.
#   2. Go to Menu
#   3. Click on 'Login' item.
# ER: User should be redirected to login page

require 'capybara'
require 'capybara/rspec'
require 'capybara/dsl'
require 'dotenv/load'
require 'rspec/expectations'
require 'selenium-webdriver'
require 'site_prism'
require_relative '../auxiliaries'

Dir['./classes/*.rb'].sort.reverse!.each {|file| require file}

Capybara.default_selector = :xpath
Capybara.current_driver = :selenium
Capybara.app_host = 'https://demoapp.strongqa.com'

RSpec.describe 'Login page can be opened via menu' do
  include RSpec::Matchers
  it 'navigates to Login page' do
    page = HomePage.new
    page.load
    page.navigate_login_page
    expect(page).to be_on_login_page
    # expect(page.on_login_page?).to be true
  end

end