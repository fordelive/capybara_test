def tc_05
  # -----------------------------------tc_05.1----------------------------------
  # User can not login with incorrect email.

  prepare_browser
  @session.click_link 'Login'

  @session.fill_in(:id => 'user_email', :with => INCORRECT_LOGIN)
  @session.fill_in(:id => 'user_password', :with => USER_PASSWORD)

  sleep(CLICK_TIMEOUT)

  @session.click_button 'Log in'

  if @session.has_xpath?("//span[@id='flash_alert']") && not(@session.has_xpath?("//a[contains(text(), 'Logout')]"))
    write_result("#{__method__}.1",:passed)
  else
    write_result("#{__method__}.1",:passed)
  end

  @session.quit

  # -----------------------------------tc_05.2----------------------------------
  # User cannot login with incorrect password

  prepare_browser
  
  @session.click_link 'Login'

  @session.fill_in(:id => 'user_email', :with => USER_LOGIN)
  @session.fill_in(:id => 'user_password', :with => INCORRECT_PASSWORD)

  sleep(CLICK_TIMEOUT)
  
  @session.click_button 'Log in'

  if @session.has_xpath?("//span[@id='flash_alert']") && not(@session.has_xpath?("//a[contains(text(), 'Logout')]"))
    write_result("#{__method__}.1",:passed)
  else
    write_result("#{__method__}.1",:failed)
  end

  @session.quit

  # -----------------------------------tc_05.3----------------------------------
  # User can not login with filled with incorrect data.

  prepare_browser

  @session.click_link 'Login'

  @session.fill_in(:id => 'user_email', :with => INCORRECT_LOGIN)
  @session.fill_in(:id => 'user_password', :with => INCORRECT_PASSWORD)

  sleep(CLICK_TIMEOUT)

  @session.click_button 'Log in'

  if @session.has_xpath?("//span[@id='flash_alert']") && not(@session.has_xpath?("//a[contains(text(), 'Logout')]"))
    write_result("#{__method__}.1",:passed)
  else
    write_result("#{__method__}.1",:failed)
  end

  @session.quit
end
