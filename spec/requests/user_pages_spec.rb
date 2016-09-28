require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.first_name) }
    it { should have_title(user.first_name) }
  end

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Register') }

  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "user_first_name",         with: "Example User"
        fill_in "user_last_name",         with: "Example User"
        fill_in "user_password",         with: "Password"
        fill_in "user_password_confirmation",         with: "Password"
        fill_in "user_email",        with: "user@example.com"

      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end


end

