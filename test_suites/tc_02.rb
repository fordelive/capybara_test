def tc_02 # User can login with correct credentials
  prepare_browser

  @session.click_link 'Login'

  @session.fill_in(:id => 'user_email', :with => CORRECT_LOGIN)
  @session.fill_in(:id => 'user_password', :with => USER_PASSWORD)
  sleep(CLICK_TIMEOUT)

  @session.click_button 'Log in'

  check_one_condition(__method__,SIGNEDIN_CONDITION)

  @session.quit
end

