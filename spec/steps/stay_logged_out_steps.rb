# frozen_string_literal: true

module StayLoggedOutSteps
  step 'User is logged in'

  step 'User logs out' do
    @page.click_link('Logout')
  end

  step 'User reopens browser and opens Homepage'
  step 'User should be logged out'
end

RSpec.configure { |c| c.include StayLoggedOutSteps }
