module TestCase02

  # Description:
  #     User can login with correct credentials
  # STR:
  #     1. Navigate to Login page.
  #     2. Fill all required fields with correct values.
  #     3. Click 'Enter' button.
  # ER: User should be logged and redirected to home page

  def tc_02
    start_time = Time.now
    puts "#{MSG_STARTING_TEST} tc 02"

    @page2 = LoginPage.new

    begin
      log_event __method__, 'Opening Login page'

      @page2.load
      expect(@page2).to be_displayed

      log_event __method__, 'Log user in'
      @page2.log_user_in USER_LOGIN, USER_PASSWORD

      result = evaluate_result __method__, @page2.login_successful?

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
