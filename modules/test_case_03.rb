module TestCase_03
  def TestCase_03.tc_03_1
    # Description:
    #     User can login with remembering credentials
    # STR:
    #     1. Navigate to Login page in browser.
    #     2. Fill all required fields with correct values.
    #     3. Check 'Remember me' checkbox.
    #     4. Click 'Enter' button.
    # ER: User should be logged and redirected to home page.

    begin
      log_event __method__, 'Opening Login page'
      @login_page = LoginPage.new.load
      expect(@login_page).to be_displayed

    rescue Exception => e
      handle_exception __method__, e
      abort MSG_PAGE_INACCESSIBLE
    end


  end

  def TestCase_03.tc_03_2
    # Description:
    #     User can login with remembering credentials
    # STR:
    #     Prerequisites: tc_03.1
    #     1. Close browser.
    #     2. Open the same browser from step 2. 3. Navigate to Home page.
    #     3. Navigate to Home page.
    # ER: User should be logged to the system.

  end

  def TestCase_03.tc_03_3
    # Description:
    #     User shouldn't be logged to the system after logout
    # STR:
    #     Prerequisites: tc_03.1
    #     1. Click 'Logout' button.
    #     2. Close browser.
    #     3. Open the same browser from step 2.
    #     4. Navigate to Home page.
    # ER: User should not be logged to the system.

  end
end
