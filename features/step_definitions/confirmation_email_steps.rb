
And(/^I enter the valid details while register/) do
  waiting_deliveries = ActionMailer::Base.deliveries.length
  fill_in "user_first_name",         with: "Example User"
  fill_in "user_last_name",         with: "Example User"
  fill_in "user_password",         with: "Password"
  fill_in "user_password_confirmation",         with: "Password"
  fill_in "user_email",        with: "user@example.com"
  click_button "Create my account"
  ActionMailer::Base.deliveries.length.should == waiting_deliveries + 1
end

Then (/^I  should get a confimarion email/) do

    ActionMailer::Base.deliveries.last(1).each do |email|
      expect(email.to.first == "user@example.com").to eq(true)
    end
end


And(/^I enter the Invald details while register/) do
  waiting_deliveries = ActionMailer::Base.deliveries.length
  fill_in "user_first_name",         with: "Example User"
  fill_in "user_last_name",         with: "Example User"
  fill_in "user_password",         with: "Password"
  fill_in "user_password_confirmation",         with: "Password"
  fill_in "user_email",        with: "user@example.com"
  ActionMailer::Base.deliveries.length.should_not == waiting_deliveries + 1

end

Then (/^I should not get a confimration email/) do



end