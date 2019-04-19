class HomePage < SitePrism::Page
  set_url '/'

  def navigate_login_page
    click_on 'Login'
  end
end
