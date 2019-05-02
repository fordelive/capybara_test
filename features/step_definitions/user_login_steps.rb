Given(/^User visits Login page$/) do
  @page = LoginPage.new
  @page.load
end

When(/^User logs in with (.*) login and (.*) password and (.*) remember me checkbox$/) do |login, password, remember|
  case login
  when 'correct'
    login = CORRECT_LOGIN
  when 'incorrect'
    login = INCORRECT_LOGIN
  when 'empty'
    login = ''
  end

  case password
  when 'correct'
    password = CORRECT_PASSWORD
  when 'incorrect'
    password = INCORRECT_PASSWORD
  when 'empty'
    password = ''
  end

  if remember == 'checked'
    @page.log_user_in login, password, true
  else
    @page.log_user_in login, password
  end
end

Then(/^Login should be (.*)$/) do |state|
  case state
  when 'successful'
    expect(@page).to be_login_successful
  when 'failed'
    expect(@page).to be_login_failed
  end
end

