require 'spec_helper'

describe "Static pages" do
  let(:base_title) { "Club" }
  describe "Home page" do

    it "should have the content 'Welcome to serler'" do
      visit '/static_pages/home'
      expect(page).to have_content('Welcome to Serler')
    end


    it "should not have a custom page title" do
      visit '/static_pages/home'
      expect(page).not_to have_title('| Home')
    end
  end
  describe "About page" do

    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end

  end

end

