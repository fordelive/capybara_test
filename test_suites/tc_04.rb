def tc_04
  # -----------------------------------tc_04.1----------------------------------
  # User can not login with blank password

  prepare_browser

  @session.click_link 'Login'

  @session.fill_in(:id => 'user_email', :with => USER_LOGIN)
  @session.fill_in(:id => 'user_password', :with => '')

  sleep(CLICK_TIMEOUT)

  @session.click_button 'Log in'

  if (expect(@session).to have_xpath("//span[@id='flash_alert']")) &&
      (expect(@session).to have_xpath("//h3[contains(text(), 'Login form')]"))
    write_result("#{__method__}.1",:passed)
  else
    write_result("#{__method__}.1",:failed)
  end

  @session.quit

  # -----------------------------------tc_04.2----------------------------------
  # User can not login with blank email

  prepare_browser

  @session.click_link 'Login'

  @session.fill_in(:id => 'user_email', :with => '')
  @session.fill_in(:id => 'user_password', :with => USER_PASSWORD)

  sleep(CLICK_TIMEOUT)

  @session.click_button 'Log in'

  if (expect(@session).to have_xpath("//span[@id='flash_alert']")) &&
     (expect(@session).to have_xpath("//h3[contains(text(), 'Login form')]"))
    write_result("#{__method__}.2",:passed)
  else
    write_result("#{__method__}.2",:failed)
  end

  @session.quit

  # -----------------------------------tc_04.3----------------------------------
  # User can not login with blank data

  prepare_browser

  @session.click_link 'Login'

  @session.fill_in(:id => 'user_email', :with => '')
  @session.fill_in(:id => 'user_password', :with => '')

  sleep(CLICK_TIMEOUT)

  @session.click_button 'Log in'

  if (expect(@session).to have_xpath("//span[@id='flash_alert']")) &&
     (expect(@session).to have_xpath("//h3[contains(text(), 'Login form')]"))
    write_result("#{__method__}.3",:passed)
  else
    write_result("#{__method__}.3",:failed)
  end

  @session.quit
end
