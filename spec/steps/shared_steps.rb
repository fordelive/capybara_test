# frozen_string_literal: true

step 'User is logged in' do
  @page = LoginPage.new
  @page.load
  @page.log_user_in CORRECT_LOGIN, CORRECT_PASSWORD, true
end

step 'User reopens browser and opens Homepage' do
  @session_cookies = Capybara.page.driver.browser.manage.all_cookies
  Capybara.current_session.reset_session!

  @page = HomePage.new
  @page.load

  @page.page.driver.browser.manage.delete_all_cookies

  @session_cookies.each {|cookie| @page.page.driver.browser.manage.add_cookie(cookie)}
  @page.page.driver.refresh
end

step 'User should be logged out' do
  expect(@page).to be_logout_successful
end