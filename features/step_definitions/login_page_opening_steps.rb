Given(/^User visits the Home page$/) do
  @page = HomePage.new
  @page.load
end

When(/^User clicks Login link$/) do
  @page.navigate_login_page
end

Then(/^The Login page is opened$/) do
  expect(@page).to be_on_login_page
end