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

    start_time = Time.now
    puts "#{MSG_STARTING_TEST} tc 04.1"

    @page41 = LoginPage.new

    begin
      log_event "#{__method__}.1", 'Opening Login page'

      @page41.load
      expect(@page41).to be_displayed

      log_event "#{__method__}.1", 'Log user in'

      @page41.log_user_in USER_LOGIN, ''

      result = evaluate_result "#{__method__}.1", @page41.login_failed?

    rescue Selenium::WebDriver::Error::WebDriverError => e
      handle_exception __method__, e

    rescue Capybara::ElementNotFound => e
      handle_exception __method__, e

    else
      puts "#{MSG_FINISHING_TEST} #{result} (execution time: #{Time.now - start_time})"
    ensure
      Capybara.current_session.reset_session!
    end

    # ts_04.2
    # Descriptiom: User cannot login with blank email
    # STR:
    #      1. Navigate to Login page.
    #      2. Fill all required fields with correct values except email field.
    #      3. Email field shoud be empty.
    #      4. Click 'Enter' button
    # ER: User should not be logged to the system. User should see next message: 'Invalid email or password.'

    start_time = Time.now
    puts "#{MSG_STARTING_TEST} tc 04.2"

    @page42 = LoginPage.new

    begin
      log_event "#{__method__}.2", 'Opening Login page'

      @page42.load
      expect(@page42).to be_displayed

      log_event "#{__method__}.2", 'Log user in'

      @page42.log_user_in '', USER_PASSWORD

      result = evaluate_result "#{__method__}.2", @page42.login_failed?

    rescue Selenium::WebDriver::Error::WebDriverError => e
      handle_exception __method__, e

    rescue Capybara::ElementNotFound => e
      handle_exception __method__, e
    else
      puts "#{MSG_FINISHING_TEST} #{result} (execution time: #{Time.now - start_time})"
    ensure
      Capybara.current_session.reset_session!
    end

    # Description: User cannot login with blank data
    # STR:
    #      1. Navigate to Login page.
    #      2. Do not fill all required fields.
    #      3. Click 'Enter' button.
    #
    # ER: User should not be logged to the system. User should see next message: 'Invalid email or password.'

    start_time = Time.now
    puts "#{MSG_STARTING_TEST} tc 04.3"

    @page43 = LoginPage.new

    begin
      log_event "#{__method__}.3", 'Opening Login page'

      @page43.load
      expect(@page43).to be_displayed

      log_event "#{__method__}.3", 'Log user in'

      @page43.log_user_in '', ''

      result = evaluate_result "#{__method__}.3", @page43.login_failed?

    rescue Selenium::WebDriver::Error::WebDriverError => e
      handle_exception __method__, e

    rescue Capybara::ElementNotFound => e
      handle_exception __method__, e
    else
      puts "#{MSG_FINISHING_TEST} #{result} (execution time: #{Time.now - start_time})"
    ensure
      Capybara.current_session.reset_session!
    end
  end
end
