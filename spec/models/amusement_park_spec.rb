require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  describe 'relationships' do
    it { should have_many :rides }
  end

  describe "#average_thrill_rating" do
    it "returns the average thrill rating of all it's rides" do
      amusement_park = AmusementPark.create(name: "Hershey Park",
                                            admission_price: "50.00")

      amusement_park.rides.create(          name: "Lightning Racer",
                                            thrill_rating: 10)

      amusement_park.rides.create(          name: "Storm Runner",
                                            thrill_rating: 5)

      amusement_park.rides.create(          name: "The Great Bear",
                                            thrill_rating: 2)

      # since 17 divided by 3 is a repeating decimal,
      # I'm using math in my test just to get the exact
      # value that will return in the program
      expect(amusement_park.average_thrill_rating.to_f).to eq(17.0/3)
    end
  end
end
