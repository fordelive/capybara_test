def tc_01 # User can open login page via menu
  @home_page = HomePage.new
  @home_page.load
  @home_page.navigate_login_page
  expect(@home_page).to have_xpath(ON_LOGIN_FORM_CONDITION)

  # @session.click_link 'Login'
  # sleep(CLICK_TIMEOUT)
  #
  # check_one_condition(__method__,ON_LOGIN_FORM_CONDITION)


end