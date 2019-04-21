class WebPage < SitePrism::Page
  element :field_email, "//input[@id='user_email']"
  element :field_password, "//input[@id='user_password']"
  element :btn_submit, "//input[@type='submit']"
  element :link_logout, "//a[contains(text(),'Logout')]"
  element :checkbox_remember_me, "//label[@for='user_remember_me']"

  element :link_login, "//a[contains(text(),'Login')]"
  element :heading_login_form, "//h3[contains(text(),'Login form')]"

  element :flash_alert, "//span[contains(text(), 'Invalid email or password')]"

  def log_user_in(user_login, user_password, remember_me = false)
    log_event __method__, 'Logging User in'
    begin
      log_event __method__, 'Filling in email and password'

      field_email.set user_login
      field_password.set user_password
      checkbox_remember_me.click if remember_me

      sleep CLICK_TIMEOUT

      log_event __method__, 'Submitting user credentials'

      btn_submit.click

      sleep CLICK_TIMEOUT
    rescue Exception => e
      handle_exception __method__, e
    end
  end

  def log_user_out
    link_logout.click
  end

  def navigate_login_page
    link_login.click
  end

  def on_login_page?
    heading_login_form.exist
  end

  def login_successful?
    link_logout.exist
  end

  def logout_successful?
    link_login.exist
  end

  def login_failed?
    flash_alert.exist
  end
end