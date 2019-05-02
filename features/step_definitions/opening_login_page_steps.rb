Given(/^User visits the Home page$/) do
  @page = HomePage.new
  @page.load
end

When(/^User clicks Login link$/) do
  @page.navigate_login_page
end

Then(/^User has navigated to the Login page$/) do
  expect(@page).to be_on_login_page
end