def tc_01 # User can open login page via menu
  prepare_browser

  @session.click_link 'Login'
  sleep(CLICK_TIMEOUT)

  check_one_condition(__method__,ON_LOGIN_FORM_CONDITION)

  @session.quit
end