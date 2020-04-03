require 'rails_helper'

RSpec.describe "As a visitor,", type: :feature do
  describe "when I visit an amusement park's show page" do
    it "I see the name and price of admissions for that amusement park
    And I see the names of all the rides that are at that theme park listed in alphabetical order
    And I see the average thrill rating of this amusement park’s rides" do
      amusement_park = AmusementPark.create(name: "Hershey Park",
                                            admission_price: "50.00")

      Ride.create(                          name: "Lightning Racer",
                                            thrill_rating: 10)

      Ride.create(                          name: "Storm Runner",
                                            thrill_rating: 5)
                                            
      Ride.create(                          name: "The Great Bear",
                                            thrill_rating: 2)

      visit "/amusement_parks/#{amusement_park.id}"

      expect(page).to have_content("Hershey Park")
      expect(page).to have_content("Admissions: $50.00")

      expect(page).to have_content("Lightning Racer")
      expect(page).to have_content("Storm Runner")
      expect(page).to have_content("The Great Bear")

      # the actual average is 5.666~ repeating, but I'm rounding to one decimal place
      expect(page).to have_content("Average Thrill Rating of Rides: 5.7/10")
    end
  end
end





# Story 2
# As a visitor,
# When I visit an amusement park’s show page
# I see the name and price of admissions for that amusement park
# And I see the names of all the rides that are at that theme park listed in alphabetical order
# And I see the average thrill rating of this amusement park’s rides
#
# Ex: Hershey Park
#     Admissions: $50.00
#
#     Rides:
#            1. Lightning Racer
#            2. Storm Runner
#            3. The Great Bear
#
#     Average Thrill Rating of Rides: 7.8/10
