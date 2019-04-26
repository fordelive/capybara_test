module OpenLoginPageSteps
  step "I visit the Home page" do
    @page = HomePage.new
    @page.load
  end

  step "I click :name link" do |name|
    @page.navigate_login_page
  end

  step "I have navigated to the Login page" do
    expect(@page).to be_on_login_page
  end
end

RSpec.configure { |c| c.include OpenLoginPageSteps }