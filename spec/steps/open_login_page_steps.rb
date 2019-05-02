# frozen_string_literal: true

module OpenLoginPageSteps
  step 'User visits the Home page' do
    @page = HomePage.new
    @page.load
  end

  step 'User clicks Login link' do
    @page.navigate_login_page
  end

  step 'User has navigated to the Login page' do
    expect(@page).to be_on_login_page
  end
end

RSpec.configure { |c| c.include OpenLoginPageSteps }