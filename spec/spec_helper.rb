Bundler.require(:test)
Dotenv.load
Dir['./classes/*.rb'].sort.reverse!.each {|file| require file}
require 'shared_examples'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.after(:each) {Capybara.current_session.reset_session!}
end

Capybara.configure do |config|
  config.default_driver = :selenium
  config.default_selector = :xpath
  config.app_host = 'http://demoapp.strongqa.com/'
end