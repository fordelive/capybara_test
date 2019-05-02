Given(/^User visits Login page$/) do
  @page = LoginPage.new
  @page.load
end

When(/^User logs in with (.*) login and (.*) password and (.*) remember me checkbox$/) do |login, password, remember|
  case login
  when 'correct'
    login = CORRECT_LOGIN
  when 'incorrect'
    login = INCORRECT_LOGIN
  when 'empty'
    login = ''
  end

  case password
  when 'correct'
    password = CORRECT_PASSWORD
  when 'incorrect'
    password = INCORRECT_PASSWORD
  when 'empty'
    password = ''
  end

  if remember == 'checked'
    @page.log_user_in login, password, true
  else
    @page.log_user_in login, password
  end
end

Then(/^Login should be (.*)$/) do |state|
  case state
  when 'successful'
    expect(@page).to be_login_successful
  when 'failed'
    expect(@page).to be_login_failed
  end
end

When(/^User reopens browser and opens Homepage$/) do
  @session_cookies = Capybara.page.driver.browser.manage.all_cookies
  Capybara.current_session.reset_session!

  @page = HomePage.new
  @page.load

  @page.page.driver.browser.manage.delete_all_cookies

  @session_cookies.each {|cookie| @page.page.driver.browser.manage.add_cookie(cookie)}
  @page.page.driver.refresh
end

And(/^User logs out$/) do
  @page.click_link('Logout')
end

Then(/^User should be logged out$/) do
  expect(@page).to be_logout_successful
end