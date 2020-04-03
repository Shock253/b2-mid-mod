require 'rails_helper'

RSpec.describe "As a user,", type: :feature do
  describe "When I go to a mechanics show page" do
    it "I see their name, years of experience, and names of all rides they’re working on
    And I also see a form to add a ride to their workload
    When I fill in that field with an id of an existing ride and hit submit
    I’m taken back to that mechanics show page
    And I see the name of that newly added ride on this mechanics show page" do
      mechanic = Mechanic.create(           name: "Kara Smith",
                                            years_experience: 11)

      amusement_park = AmusementPark.create(name: "Hershey Park",
                                            admission_price: "50.00")

      ride_1 = amusement_park.rides.create( name: "The Frog Hopper",
                                            thrill_rating: 10)

      ride_2 = amusement_park.rides.create( name: "Fahrenheit",
                                            thrill_rating: 5)

      ride_3 = amusement_park.rides.create( name: "The Kiss Raise",
                                            thrill_rating: 2)

      ride_4 = amusement_park.rides.create( name: "Lightning Racer",
                                            thrill_rating: 5)

      MechanicRide.create(mechanic: mechanic, ride: ride_1)
      MechanicRide.create(mechanic: mechanic, ride: ride_2)
      MechanicRide.create(mechanic: mechanic, ride: ride_3)

      visit "/mechanics/#{mechanic.id}"

      expect(page).to have_content("Kara Smith")


      expect(page).to have_content("Mechanic: Kara Smith")
      expect(page).to have_content("Years of Experience: 11")
      expect(page).to have_content("Current rides they’re working on:")
      expect(page).to have_content("The Frog Hopper")
      expect(page).to have_content("Fahrenheit")
      expect(page).to have_content("The Kiss Raise")

      fill_in "Ride", with: "#{ride_4.id}"

      click_button "Submit"

      expect(page).to have_current_path("/mechanics/#{mechanic.id}")
      expect(page).to have_content("Lightning Racer")
    end
  end
end
# Story 3
# As a user,
# When I go to a mechanics show page
# I see their name, years of experience, and names of all rides they’re working on
# And I also see a form to add a ride to their workload
# When I fill in that field with an id of an existing ride and hit submit
# I’m taken back to that mechanics show page
# And I see the name of that newly added ride on this mechanics show page
#
# Ex:
#
# Mechanic: Kara Smith
# Years of Experience: 11
#
# Current rides they’re working on:
# The Frog Hopper
# Fahrenheit
# The Kiss Raise
#
# Add a ride to workload:
#  _pretent_this_is_a_textfield_
#                        Submit
