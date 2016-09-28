require 'spec_helper'

describe "AuthenticationPages" do
    subject { page }

    describe "signin page" do
      before { visit signin_path }

      it { should have_content('Login') }
      it { should have_title('Login') }


      describe "with invalid information" do
        before { click_button "Login" }

        it { should have_title('Login') }
        #it { should have_selector('div.alert.alert-error') }
      end

      describe "with valid information" do
        let(:user) { FactoryGirl.create(:user) }
        before do
          fill_in "Email",    with: user.email.upcase
          fill_in "Password", with: user.password
          click_button "Login"

        end

        it { should have_title(user.first_name) }
        it { should have_link('Profile',     href: user_path(user)) }
        it { should have_link('Logout',    href: signout_path) }
        it { should_not have_link('Login', href: signin_path) }
      end
    end

end
