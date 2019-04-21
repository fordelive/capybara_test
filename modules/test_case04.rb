module TestCase04
  def tc_04
    # tc_04.1
    # Description: User can not login with blank password
    # STR
    #     1. Navigate to Login page.
    #     2. Fill all required fields with correct
    #     3. Password field should be empty.
    #     4. Click 'Enter' button.
    # ER: User should not be logged to the system. User should see next message:'Invalid email or password.'

    @page41 = LoginPage.new

    begin
      log_event __method__, 'Opening Login page'

      @page41.load
      expect(@page41).to be_displayed

      log_event __method__, 'Log user in'

      @page41.log_user_in USER_LOGIN, ''

    rescue Exception => e
      handle_exception __method__, e
      abort MSG_PAGE_INACCESSIBLE
    end

    evaluate_result __method__, @page41.login_failed?

    Capybara.current_session.driver.quit

    # ts_04.2
    # Descriptiom: User cannot login with blank email
    # STR:
    #      1. Navigate to Login page.
    #      2. Fill all required fields with correct values except email field.
    #      3. Email field shoud be empty.
    #      4. Click 'Enter' button
    # ER: User should not be logged to the system. User should see next message: 'Invalid email or password.'

    @page42 = LoginPage.new

    begin
      log_event __method__, 'Opening Login page'

      @page42.load
      expect(@page42).to be_displayed

      log_event __method__, 'Log user in'

      @page42.log_user_in '', USER_PASSWORD

    rescue Exception => e
      handle_exception __method__, e
      abort MSG_PAGE_INACCESSIBLE
    end

    evaluate_result __method__, @page42.login_failed?

    Capybara.current_session.driver.quit

    # Description: User cannot login with blank data
    # STR:
    #      1. Navigate to Login page.
    #      2. Do not fill all required fields.
    #      3. Click 'Enter' button.
    #
    # ER: User should not be logged to the system. User should see next message: 'Invalid email or password.'

    @page43 = LoginPage.new

    begin
      log_event __method__, 'Opening Login page'

      @page43.load
      expect(@page43).to be_displayed

      log_event __method__, 'Log user in'

      @page43.log_user_in '', ''

    rescue Exception => e
      handle_exception __method__, e
      abort MSG_PAGE_INACCESSIBLE
    end

    evaluate_result __method__, @page43.login_failed?

    Capybara.current_session.driver.quit
  end
end
