module UserLoginSteps
  step "I visit Login page" do
    @page = LoginPage.new
    @page.load
  end

  step "I log in with :login and :password and :remember" do |login, password, remember|
    # byebug
    if remember == 'true'
      @page.log_user_in login, password, true
    else
      @page.log_user_in login, password
    end
  end

  step "Login should be successful" do
    # byebug
    expect(@page).to be_login_successful
  end

  step"Login should be failed" do
    # byebug
    expect(@page).to be_login_failed
  end
end

RSpec.configure { |c| c.include UserLoginSteps }