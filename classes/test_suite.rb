class TestSuite
  def tc_01
    @home_page = Home.new
    @home_page.load
    @home_page.navigate_login_page
    expect(@home_page).to have_xpath(ON_LOGIN_FORM_CONDITION)
  end
end
