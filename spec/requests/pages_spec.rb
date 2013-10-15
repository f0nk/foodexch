require 'spec_helper'

describe "Pages" do

  describe "About page" do

    it "should have the content 'Sample App'" do
      visit '/pages/about'
      page.should have_content('Sample App')
    end
  end
end