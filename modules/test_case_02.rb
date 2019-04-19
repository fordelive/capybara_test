module TestCase_02
  def TestCase_02.tc_02
    # Description:
    #     User can login with correct credentials
    # STR:
    #     1. Navigate to Login page.
    #     2. Fill all required fields with correct values.
    #     3. Click 'Enter' button.
    # ER: User should be logged and redirected to home page

    @login_page = LoginPage.new

    begin
      log_event __method__, 'Opening Loginpage'
      @login_page.load
      expect(@login_page).to be_displayed
      log_event __method__, 'Done'

    rescue Exception => e
      handle_exception e
      abort MSG_PAGE_INACCESSIBLE
    end

    @login_page.log_user_in

    evaluate_result __method__, @login_page.login_successful?
  end
end
