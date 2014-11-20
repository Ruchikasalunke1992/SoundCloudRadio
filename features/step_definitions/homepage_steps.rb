Given(/^I am on the homepage$/) do
  visit sessions_path
end

When(/^I am not logged into SoundCloud Radio$/) do
  assert @current_user == nil
end

Then(/^I should see a "Login" button$/) do
  find(:button, 'Login')
end

Then(/^I should see a "Logout" button$/) do
  pending
end

When(/^I am logged into SoundCloud Radio as (.*?)$/) do |arg1|
  @current_user = User.new(
      :session_token => 'fake token',
      :username => arg1,
  )
  @current_user.save!
  visit sessions_path
end

Then(/^I should see a greeting saying "(.*?)"$/) do |arg1|
  pending
end