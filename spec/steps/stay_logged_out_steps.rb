# frozen_string_literal: true

module StayLoggedOutSteps
  step 'I am logged in'

  step 'I log out' do
    @page.click_link('Logout')
  end

  step 'I reopen browser and open Homepage'
  step 'I showld be logged out'
end

RSpec.configure { |c| c.include StayLoggedOutSteps }
