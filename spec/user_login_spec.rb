# frozen_string_literal: true

USER_LOGIN = ENV.fetch('LOGIN')
USER_PASSWORD = ENV.fetch('PASSWORD')

INCORRECT_LOGIN = 'blabla@mail.net'
INCORRECT_PASSWORD = '123456'

describe 'User opens Login page' do #tc 01
  context 'by clicking Login menu' do
    it 'Login page is opened' do
      page = HomePage.new
      page.load
      page.navigate_login_page

      expect(page).to be_on_login_page
    end
  end
end

describe 'User logs in' do
  context 'with correct credentials' do #tc 02

    include_examples 'User can log in', USER_LOGIN, USER_PASSWORD
  end

  context 'with correct credentials and remember_me option' do # tc 03.1
    include_examples 'User can log in', USER_LOGIN, USER_PASSWORD, true
  end

  context 'with blank password' do
    include_examples 'User cannot log in', USER_LOGIN, ''
  end
  context 'with blank email' do
    include_examples 'User cannot log in', '', USER_PASSWORD
  end
  context 'with blank with blank data' do
    include_examples 'User cannot log in', '', ''
  end

  context 'with incorrect email' do
    include_examples 'User cannot log in', INCORRECT_LOGIN, USER_PASSWORD
  end
  context 'with incorrect password' do
    include_examples 'User cannot log in', USER_LOGIN, INCORRECT_PASSWORD
  end
  context 'with blank with incorrect data' do
    include_examples 'User cannot log in', INCORRECT_LOGIN, INCORRECT_PASSWORD
  end
end


#   context 'when logged in User opens homepage' do
#     it 'he is logged in' do # tc 3.2
#       session_cookies = Capybara.page.driver.browser.manage.all_cookies
#       Capybara.current_session.reset_session!
#
#       @@page = HomePage.new
#       @@page.load
#       @@page.page.driver.browser.manage.delete_all_cookies
#       session_cookies.each {|cookie| @@page.page.driver.browser.manage.add_cookie(cookie)}
#       @@page.page.driver.refresh
#
#       expect(@@page).to be_login_successful
#     end
#   end
#
#   context 'when logged User opens homepage' do
#     it 'he is not logged in' do # tc 3.3
#       @@page.log_user_out
#       session_cookies = Capybara.page.driver.browser.manage.all_cookies
#
#       Capybara.current_session.reset_session!
#
#       page2 = HomePage.new
#       page2.load
#       page2.page.driver.browser.manage.delete_all_cookies
#       session_cookies.each {|cookie| page2.page.driver.browser.manage.add_cookie(cookie)}
#
#       expect(page2).to be_logout_successful
#     end
#   end
# end
