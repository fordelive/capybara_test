module TestCase_01
  def TestCase_01.tc_01
    # Description:
    #     User can open login page via menu
    # STR:
    #   1. Navigate to Home page as User.
    #   2. Go to Menu
    #   3. Click on 'Login' item.
    # ER: User should be redirected to login page

    @home_page = HomePage.new

    begin
      log_event __method__, 'Opening Home page'

      @home_page.load
      expect(@home_page).to be_displayed

      log_event __method__, 'Navigating to Login page'
      @home_page.navigate_login_page

    rescue Exception => e
      handle_exception __method__, e
      abort MSG_PAGE_INACCESSIBLE
    end

    evaluate_result __method__, @home_page.has_xpath?(ON_LOGIN_FORM_CONDITION)
  end
end

