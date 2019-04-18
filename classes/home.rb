# require 'capybara'
# require 'site_prism'
# require 'selenium-webdriver'

TEST_URL = 'https://demoapp.strongqa.com'

class Home < SitePrism::Page
  set_url '/'
  def navigate_login_page
    click_on 'Login'
  end
end
