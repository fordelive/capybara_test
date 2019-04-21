class HomePage < SitePrism::Page
  set_url '/'

  element :link_login, "//a[contains(text(),'Login')]"
  element :heading_login_form, '//h3[contains(text(),\'Login form\')]'
  element :link_logout, "//a[contains(text(),'Logout')]"

  def navigate_login_page
    link_login.click
  end

  def on_login_page?
    heading_login_form.text == 'LOGOUT'
  end

  def login_successful?
    link_logout.text == 'LOGOUT'
  end
end
