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

  if expect(@session).to have_xpath("//a[contains(text(), 'Logout')]")
    write_result("#{__method__}.1",:passed)
  else
    write_result("#{__method__}.1", :failed)
  end

  # --------------------------case tc_03.2-------------------------------
  # User is signed in automatically when reopening the site

  session_cookies = @session.driver.browser.manage.all_cookies
  @session.quit

  prepare_browser
  session_cookies.each {|cookie| @session.driver.browser.manage.add_cookie(cookie)}
  @session.driver.refresh

  if expect(@session).to have_xpath("//a[contains(text(), 'Logout')]")
    write_result("#{__method__}.2",:passed)
  else
    write_result("#{__method__}.2",:failed)
    @session.quit
    abort
  end

  # ---------------------------case tc_03.03------------------------------
  # User shouldn't be logged the site after logout
  @session.click_link('Logout')
  sleep(CLICK_TIMEOUT)

  session_cookies = @session.driver.browser.manage.all_cookies
  @session.quit

  prepare_browser
  session_cookies.each {|cookie| @session.driver.browser.manage.add_cookie(cookie)}
  @session.driver.refresh

  if expect(@session).to have_xpath("//a[contains(text(), 'Login')]")
    write_result("#{__method__}.3", :passed)
  else
    write_result("#{__method__}.3", :failed)
  end

  @session.quit
end
