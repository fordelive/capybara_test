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
  after(:each) {Capybara.current_session.reset_session!}
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

describe 'User opens Home page' do
  let(:log_user_in) do
    page = LoginPage.new
    page.load
    page.log_user_in USER_LOGIN, USER_PASSWORD
    return page
  end
  let(:open_home_page) do
    page = HomePage.new
    page.load
    page.page.driver.browser.manage.delete_all_cookies
    @session_cookies.each {|cookie| page.page.driver.browser.manage.add_cookie(cookie)}
    return page
  end

  context 'when User logged in with remember_me' do
    after(:context) {Capybara.current_session.reset_session!}
    it 'User stays logged in' do
      log_user_in

      @session_cookies = Capybara.page.driver.browser.manage.all_cookies
      Capybara.current_session.reset_session!

      page = open_home_page
      page.page.driver.refresh

      expect(page).to be_login_successful
    end
  end

  context 'when User logged out' do
    it 'User stays logged out' do
      page = log_user_in

      page.log_user_out
      @session_cookies = Capybara.page.driver.browser.manage.all_cookies
      Capybara.current_session.reset_session!

      page = open_home_page
      page.page.driver.refresh

      expect(page).to be_logout_successful
    end
  end
end

