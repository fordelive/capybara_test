shared_examples 'User can log in' do |login, password, remember_me = false|
  it 'Login successful' do
    page = LoginPage.new
    page.load
    page.log_user_in login, password
    expect(page).to be_login_successful
  end
end

shared_examples 'User cannot log in' do |login, password, remember_me = false|
  it 'Not logged in' do
    page = LoginPage.new
    page.load
    page.log_user_in login, password
    expect(page).to be_login_failed
  end
end