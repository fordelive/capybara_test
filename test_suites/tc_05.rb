def tc_05
  # -----------------------------------tc_05.1----------------------------------
  # User can not login with incorrect email.

  prepare_browser
  @session.click_link 'Login'

  @session.fill_in(:id => 'user_email', :with => INCORRECT_LOGIN)
  @session.fill_in(:id => 'user_password', :with => USER_PASSWORD)

  sleep(CLICK_TIMEOUT)

  @session.click_button 'Log in'

  check_two_conditions("#{__method__}.1", CANNOT_LOGIN_COND1, CANNOT_LOGIN_COND2)

  @session.quit

  # -----------------------------------tc_05.2----------------------------------
  # User cannot login with incorrect password

  prepare_browser
  
  @session.click_link 'Login'

  @session.fill_in(:id => 'user_email', :with => USER_LOGIN)
  @session.fill_in(:id => 'user_password', :with => INCORRECT_PASSWORD)

  sleep(CLICK_TIMEOUT)
  
  @session.click_button 'Log in'

  check_two_conditions("#{__method__}.2", CANNOT_LOGIN_COND1, CANNOT_LOGIN_COND2)

  @session.quit

  # -----------------------------------tc_05.3----------------------------------
  # User can not login with filled with incorrect data.

  prepare_browser

  @session.click_link 'Login'

  @session.fill_in(:id => 'user_email', :with => INCORRECT_LOGIN)
  @session.fill_in(:id => 'user_password', :with => INCORRECT_PASSWORD)

  sleep(CLICK_TIMEOUT)

  @session.click_button 'Log in'

  check_two_conditions("#{__method__}.3", CANNOT_LOGIN_COND1, CANNOT_LOGIN_COND2)

  @session.quit
end
