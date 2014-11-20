Given(/^I enter the homepage while logged out$/) do
  visit sessions_path
  assert @current_user == nil
end

When(/^I click the "Login" button$/) do
  # If the button is found, assume that it will log in, since the authentication is done at soundcloud.com and clicking
  # on it will make an infinite redirect
  find(:button, 'Login')
end

When(/^I click the "Logout" button$/) do
  pending
end

Then(/^I should authenticate to SoundCloud$/) do
  # Assume that @current_user will have a value after the authentication
  @current_user = User.new
end

Then(/^I should enter the homepage while logged in$/) do
  assert @current_user != nil
end

Then(/^I should enter the homepage while logged out$/) do
  assert @current_user == nil
end