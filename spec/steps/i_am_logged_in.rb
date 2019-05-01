step "I am logged in" do
  @page = LoginPage.new
  @page.load
  @page.log_user_in CORRECT_LOGIN, CORRECT_PASSWORD, true
end