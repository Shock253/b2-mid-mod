require 'rails_helper'

RSpec.describe "As a user,", type: :feature do
  describe "when I visit a mechanics index page" do
    it "I see a header saying all mechanics
    and a list of all mechanics' names and years of experience" do
      mechanic_1 = Mechanic.create( name: "Sam Mills",
                                    years_experience: 10)
      mechanic_2 = Mechanic.create( name: "Kara Smith",
                                    years_experience: 11)

      visit "/mechanics"

      expect(page).to have_css("h1", text: "All Mechanics", visible: true)

      within "#mechanic-#{mechanic_1.id}" do
        expect(page).to have_content("Sam Mills - 10 years of experience")
      end

      within "#mechanic-#{mechanic_2.id}" do
        expect(page).to have_content("Kara Smith - 11 years of experience")
      end
    end
  end
end



# Story 1
# As a user,
# When I visit a mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
#
#
# Ex:
#               All Mechanics
#
#     Sam Mills - 10 years of experience
#     Kara Smith - 11 years of experience
#
