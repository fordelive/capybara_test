module TestCase03
  def tc_03
    # tc 03.1
    # Description:
    #     User can login with remembering credentials
    # STR:
    #     1. Navigate to Login page in browser.
    #     2. Fill all required fields with correct values.
    #     3. Check 'Remember me' checkbox.
    #     4. Click 'Enter' button.
    # ER: User should be logged and redirected to home page.

    @page31 = LoginPage.new

    begin
      log_event __method__, 'Opening Login page'

      @page31.load
      expect(@page31).to be_displayed

    rescue Exception => e
      handle_exception __method__, e
      abort MSG_PAGE_INACCESSIBLE
    end

    @page31.log_user_in true

    evaluate_result "#{__method__}.1", @page31.login_successful?

    # tc 03.2
    # Description:
    #     User can login with remembering credentials
    # STR:
    #     Prerequisites: tc_03.1
    #     1. Close browser.
    #     2. Open the same browser from step 2. 3. Navigate to Home page.
    #     3. Navigate to Home page.
    # ER: User should be logged to the system.

    session_cookies = Capybara.page.driver.browser.manage.all_cookies

    Capybara.current_session.driver.quit

    @page32 = HomePage.new
    @page32.load

    session_cookies.each {|cookie| @page32.page.driver.browser.manage.add_cookie(cookie)}
    @page32.page.driver.refresh

    evaluate_result "#{__method__}.2", @page32.login_successful?

    # tc 03.3
    # Description:
    #     User shouldn't be logged to the system after logout
    # STR:
    #     Prerequisites: tc_03.1
    #     1. Click 'Logout' button.
    #     2. Close browser.
    #     3. Open the same browser from step 2.
    #     4. Navigate to Home page.
    # ER: User should not be logged to the system.

    @page32.log_user_out
    session_cookies = Capybara.page.driver.browser.manage.all_cookies

    Capybara.current_session.driver.quit

    @page33 = HomePage.new
    @page33.load

    session_cookies.each {|cookie| @page33.page.driver.browser.manage.add_cookie(cookie)}
    @page33.page.driver.refresh

    evaluate_result "#{__method__}.2", @page33.logout_successful?

  end
end
