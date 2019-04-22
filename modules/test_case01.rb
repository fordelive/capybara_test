module TestCase01
  # Description:
  #     User can open login page via menu
  # STR:
  #   1. Navigate to Home page as User.
  #   2. Go to Menu
  #   3. Click on 'Login' item.
  # ER: User should be redirected to login page

  def tc_01
    start_time = Time.now
    puts "#{MSG_STARTING_TEST} tc 01"

    @page1 = HomePage.new
    # @page1.load
    # @page1.navigate_login_page

    begin
      log_event __method__, 'Opening Home page'

      @page1.load
      expect(@page1).to be_displayed

      log_event __method__, 'Navigating to Login page'

      @page1.navigate_login_page

      result = evaluate_result __method__, @page1.has_xpath?(ON_LOGIN_FORM_CONDITION)

    rescue   => e
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

