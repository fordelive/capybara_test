def tc_03
  # ------------------------case tc_03.1-----------------------------
  # User can login with remembering credentials

  prepare_browser

  @session.click_link 'Login'

  @session.fill_in(:id => 'user_email', :with => USER_LOGIN)
  @session.fill_in(:id => 'user_password', :with => USER_PASSWORD)
  @session.find("//label[@for='user_remember_me']").click

  sleep(CLICK_TIMEOUT)

  @session.click_button 'Log in'

  check_one_condition("#{__method__}.1", SIGNEDIN_CONDITION)

  # --------------------------case tc_03.2-------------------------------
  # User is signed in automatically when reopening the site

  session_cookies = @session.driver.browser.manage.all_cookies
  @session.quit

  prepare_browser
  session_cookies.each {|cookie| @session.driver.browser.manage.add_cookie(cookie)}
  @session.driver.refresh

  check_one_condition("#{__method__}.2", SIGNEDIN_CONDITION)

  # ---------------------------case tc_03.03------------------------------
  # User shouldn't be logged the site after logout
  @session.click_link('Logout')
  sleep(CLICK_TIMEOUT)

  session_cookies = @session.driver.browser.manage.all_cookies
  @session.quit

  prepare_browser
  session_cookies.each {|cookie| @session.driver.browser.manage.add_cookie(cookie)}
  @session.driver.refresh

  check_one_condition("#{__method__}.3",NOT_SIGNED_CONDITION)

  @session.quit
end
