def tc_02 # User can login with correct credentials
  prepare_browser

  @session.click_link 'Login'

  @session.fill_in(:id => 'user_email', :with => USER_LOGIN)
  @session.fill_in(:id => 'user_password', :with => USER_PASSWORD)
  sleep(CLICK_TIMEOUT)

  @session.click_button 'Log in'

  if @session.has_xpath?("//a[contains(text(), 'Logout')]")
    write_result(__method__,:passed)
  else
    write_result(__method__,:failed)
  end

  @session.quit
end

