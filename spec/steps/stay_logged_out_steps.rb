module StayLoggedOutSteps
  step "I am logged in" do
    @page = LoginPage.new
    @page.load
    @page.log_user_in CORRECT_LOGIN, CORRECT_PASSWORD, true
  end

  step "I log out" do
    @page.click_link('Logout')
  end

  step "I reopen browser and open Homepage"do
    @session_cookies = Capybara.page.driver.browser.manage.all_cookies
    sleep 3
    Capybara.current_session.reset_session!
    sleep 3

    @page = HomePage.new
    @page.load
    sleep 3
    @page.page.driver.browser.manage.delete_all_cookies
    sleep 3
    @session_cookies.each {|cookie| @page.page.driver.browser.manage.add_cookie(cookie)}
    @page.page.driver.refresh
  end

  step "I showld be logged out" do
    sleep 5
    expect(@page).to be_logout_successful
  end
end

RSpec.configure { |c| c.include StayLoggedOutSteps }
