class WebPage < SitePrism::Page
  element :field_email, "#user_email"
  element :field_password, "#user_password"
  element :btn_submit, "input[name='commit']"
  element :link_logout, :xpath, "//a[contains(text(),'Logout')]"
  element :checkbox_remember_me, "label[for='user_remember_me']"

  element :link_login, :xpath, "//a[contains(text(),'Login')]"
  element :heading_login_form, "h3.authform__title"

  element :flash_alert, "#flash_alert"

  def log_user_in(user_login, user_password, remember_me = false)
    field_email.set user_login
    field_password.set user_password
    checkbox_remember_me.click if remember_me

    btn_submit.click
  end

  def log_user_out
    link_logout.click
  end

  def navigate_login_page
    link_login.click
  end

  def on_login_page?
    heading_login_form.visible?
  end

  def login_successful?
    link_logout.visible?
  end

  def logout_successful?
    link_login.visible?
  end

  def login_failed?
    flash_alert.visible?
  end
end