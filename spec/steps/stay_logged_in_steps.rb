# frozen_string_literal: true

module StayLoggedInSteps
  step 'I am logged in'
  step 'I reopen browser and open Homepage'
  step 'I showld be logged out'
end

RSpec.configure { |c| c.include StayLoggedInSteps }