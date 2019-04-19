module TestCase_1
  def TestCase_1.tc_01
    # STR:
    #   1. Navigate to Home page as User.
    #   2. Go to Menu
    #   3. Click on 'Login' item.
    # Expected Result:
    #   User should be redirected to login page

    @home_page = HomePage.new

    begin
      log_event __method__, 'Navigating to Homepage'

      @home_page.load
      expect(@home_page).to be_displayed
      @home_page.navigate_login_page

      log_event __method__, 'Done'
    rescue Exception => e
      log_event __method__, e.message
      log_event __method__, e.backtrace.inspect
      puts e.message
      abort 'Site cannot be accessed!!! Check Internet connection.'
    end

    begin
      log_event __method__, 'Checking if Login page loaded'

      expect(@home_page).to have_xpath(ON_LOGIN_FORM_CONDITION)
      write_result(__method__, :passed)

      log_event __method__, 'Done'
    rescue Exception => e
      log_event __method__, e.message
      log_event __method__, e.backtrace.inspect

      write_result(__method__, :failed)
    end
  end
end

