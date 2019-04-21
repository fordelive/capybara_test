module TestCase01
  # Description:
  #     User can open login page via menu
  # STR:
  #   1. Navigate to Home page as User.
  #   2. Go to Menu
  #   3. Click on 'Login' item.
  # ER: User should be redirected to login page

  def tc_01
    @page1 = HomePage.new

    begin
      log_event __method__, 'Opening Home page'

      @page1.load
      expect(@page1).to be_displayed

      log_event __method__, 'Navigating to Login page'
    rescue Exception => e
      handle_exception __method__, e
      abort MSG_PAGE_INACCESSIBLE
    end

    @page1.navigate_login_page

    evaluate_result __method__, @page1.has_xpath?(ON_LOGIN_FORM_CONDITION)

    Capybara.current_session.driver.quit
  end
end

