When (/^I go to the signup page/) do
  visit signup_path
end

And(/^I enter the details and press submit button/) do
  fill_in "user_first_name",         with: "Example User"
  fill_in "user_last_name",         with: "Example User"
  fill_in "user_password",         with: "Password"
  fill_in "user_password_confirmation",         with: "Password"
  fill_in "user_email",        with: "user@example.com"
end

Then (/^I should be registered/) do
  expect { click_button "Create my account"  }.to change(User, :count).by(1)
end