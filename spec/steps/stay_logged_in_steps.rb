# frozen_string_literal: true

module StayLoggedInSteps
  step 'User is logged in'
  step 'User reopens browser and opens Homepage'
  step 'User should be logged out'
end

RSpec.configure { |c| c.include StayLoggedInSteps }