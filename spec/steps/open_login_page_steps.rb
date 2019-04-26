module OpenLoginPageSteps
  step "I visit the Home page" do
    @page = HomePage.new
    @page.load
  end

  step "I click Login link" do
    @page.navigate_login_page
  end

  step "I have navigated to the Login page" do
    expect(@page).to be_on_login_page
  end
end

RSpec.configure { |c| c.include OpenLoginPageSteps }