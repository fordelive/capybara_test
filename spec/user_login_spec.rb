# frozen_string_literal: true

USER_LOGIN = ENV.fetch('LOGIN')
USER_PASSWORD = ENV.fetch('PASSWORD')

INCORRECT_LOGIN = 'blabla@mail.net'
INCORRECT_PASSWORD = '123456'

describe 'User' do #tc 01
  context 'by clicking Login menu' do
    it 'can open Login page' do
      page = HomePage.new
      page.load
      page.navigate_login_page

      expect(page).to be_on_login_page
    end
  end
end

describe 'User' do
  # after(:each) {Capybara.current_session.reset_session!}
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
  context 'with with incorrect data' do
    include_examples 'User cannot log in', INCORRECT_LOGIN, INCORRECT_PASSWORD
  end
end

describe 'User' do
  let(:login_page) {LoginPage.new}
  let(:home_page) {HomePage.new}

  context 'when logged in with remember_me' do
    # after(:context) {Capybara.current_session.reset_session!}
    it 'stays logged in when opens Home page' do
      page = login_page
      page.load
      page.log_user_in USER_LOGIN, USER_PASSWORD

      @session_cookies = Capybara.page.driver.browser.manage.all_cookies
      Capybara.current_session.reset_session!

      page = home_page
      page.load
      page.page.driver.browser.manage.delete_all_cookies

      @session_cookies.each {|cookie| page.page.driver.browser.manage.add_cookie(cookie)}
      page.page.driver.refresh

      expect(page).to be_login_successful
    end
  end

  context 'when logged out' do
    it 'stays logged out when opens Home page' do
      page = login_page
      page.load
      page.log_user_in USER_LOGIN, USER_PASSWORD

      page.log_user_out
      @session_cookies = Capybara.page.driver.browser.manage.all_cookies
      Capybara.current_session.reset_session!

      page = home_page
      page.load
      page.page.driver.browser.manage.delete_all_cookies

      @session_cookies.each {|cookie| page.page.driver.browser.manage.add_cookie(cookie)}
      page.page.driver.refresh

      expect(page).to be_logout_successful
    end
  end
end

