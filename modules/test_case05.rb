module TestCase05
  def tc_05
    # tc_05.1
    # Description: User can not login with incorrect data.
    # STR:
    #     1. Navigate to Login page.
    #     2. Fill all required fields with correct
    #     3. Email field should be filled with incorrect data.
    #     4. Click 'Enter' button.
    # ER: User should not be logged to the system. User should see next message: 'Invalid email or password.'

    @page51 = LoginPage.new

    begin
      log_event "#{__method__}.1", 'Opening Login page'

      @page51.load
      expect(@page51).to be_displayed

      log_event "#{__method__}.1", 'Log user in'

      @page51.log_user_in INCORRECT_LOGIN, USER_PASSWORD

    rescue Exception => e
      handle_exception "#{__method__}.1", e
      abort MSG_PAGE_INACCESSIBLE
    end

    evaluate_result "#{__method__}.1", @page51.login_failed?

    Capybara.current_session.reset_session!

    # ts_05.2
    # Descriptiom: User cannot login with incorrect password
    # STR:
    #      1. Navigate to Login page.
    #      2. Fill all required fields with correct values except password field.
    #      3. Password field should be filled with incorrect data.
    #      4. Click 'Enter' button.
    # ER: User should not be logged to the system. User should see next message: 'Invalid email or password.'

    @page52 = LoginPage.new

    begin
      log_event "#{__method__}.2", 'Opening Login page'

      @page52.load
      expect(@page52).to be_displayed

      log_event "#{__method__}.2", 'Log user in'

      @page52.log_user_in USER_LOGIN, INCORRECT_PASSWORD

    rescue Exception => e
      handle_exception "#{__method__}.2", e
      abort MSG_PAGE_INACCESSIBLE
    end

    evaluate_result "#{__method__}.2", @page52.login_failed?

    Capybara.current_session.reset_session!

    # Description: User cannot login with incorrect data
    # STR:
    #      1. Navigate to Login page.
    #      2. Email and Password fields should be filled with incorrect data.
    #      3. Click 'Enter' button.
    #
    # ER: User should not be logged to the system. User should see next message: 'Invalid email or password.'

    @page53 = LoginPage.new

    begin
      log_event "#{__method__}.3", 'Opening Login page'

      @page53.load
      expect(@page53).to be_displayed

      log_event "#{__method__}.3", 'Log user in'

      @page53.log_user_in INCORRECT_LOGIN, INCORRECT_PASSWORD

    rescue Exception => e
      handle_exception "#{__method__}.3", e
      abort MSG_PAGE_INACCESSIBLE
    end

    evaluate_result "#{__method__}.3", @page53.login_failed?

    Capybara.current_session.reset_session!
  end
end
