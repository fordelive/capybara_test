Dir['./classes/*.rb'].sort.reverse!.each {|file| require file}


USER_LOGIN = ENV.fetch('LOGIN')
USER_PASSWORD = ENV.fetch('PASSWORD')

RSpec.describe 'Login page can be opened via menu' do
  include RSpec::Matchers

  it 'navigates to Login page' do
    page = HomePage.new
    page.load
    page.navigate_login_page
    expect(page).to be_on_login_page
  end
end

RSpec.describe 'User can log in' do
  include RSpec::Matchers

  context 'when correct credentials are used' do
    it 'logs in successfilly' do
      page = LoginPage.new
      page.load
      page.log_user_in ENV.fetch('LOGIN'), ENV.fetch('PASSWORD')
      expect(page).to be_login_successful
    end
  end
end


