class LoginPage < SitePrism::Page
  set_url '/users/sign_in'

  element :field_email, "//input[@id='user_email']"
  element :field_password, "//input[@id='user_password']"
  element :btn_submit, "//input[@type='submit']"
  element :link_logout, "//a[contains(text(),'Logout')]"

  def log_user_in
    begin
      log_event __method__, 'Filling in email and password'

      field_email.set USER_LOGIN
      field_password.set USER_PASSWORD

      sleep CLICK_TIMEOUT

      log_event __method__, 'Submitting user credentials'

      btn_submit.click

      sleep CLICK_TIMEOUT
    rescue Exception => e
      handle_exception __method__, e
    end
  end

  def login_successful?
    link_logout.text == 'LOGOUT'
  end
end
