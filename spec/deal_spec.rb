require 'rails_helper'

RSpec.describe "Deals view" do 

  describe "see ticket and weather info" do 
    it "should see a weather forecast after selecting destination" do 
      visit '/'
      click_on "New York"
      expect(page).to have_content('New York vacation')
    end
  end
end