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
      log_event "#{__method__}.1", 'Opening Login page'

      @page41.load
      expect(@page41).to be_displayed

      log_event "#{__method__}.1", 'Log user in'

      @page41.log_user_in USER_LOGIN, ''

    rescue Exception => e
      handle_exception "#{__method__}.1", e
      abort MSG_PAGE_INACCESSIBLE
    end

    evaluate_result "#{__method__}.1", @page41.login_failed?

    Capybara.current_session.reset_session!

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
      log_event "#{__method__}.2", 'Opening Login page'

      @page42.load
      expect(@page42).to be_displayed

      log_event "#{__method__}.2", 'Log user in'

      @page42.log_user_in '', USER_PASSWORD

    rescue Exception => e
      handle_exception "#{__method__}.2", e
      abort MSG_PAGE_INACCESSIBLE
    end

    evaluate_result "#{__method__}.2", @page42.login_failed?

    Capybara.current_session.reset_session!

    # Description: User cannot login with blank data
    # STR:
    #      1. Navigate to Login page.
    #      2. Do not fill all required fields.
    #      3. Click 'Enter' button.
    #
    # ER: User should not be logged to the system. User should see next message: 'Invalid email or password.'

    @page43 = LoginPage.new

    begin
      log_event "#{__method__}.3", 'Opening Login page'

      @page43.load
      expect(@page43).to be_displayed

      log_event "#{__method__}.3", 'Log user in'

      @page43.log_user_in '', ''

    rescue Exception => e
      handle_exception "#{__method__}.3", e
      abort MSG_PAGE_INACCESSIBLE
    end

    evaluate_result "#{__method__}.3", @page43.login_failed?

    Capybara.current_session.reset_session!
  end
end
