require "rails_helper"

RSpec.describe TripChoice do 

  describe "#roundtrip_cost" do 
    it "returns the total cost of a flight" do 
      journey =  {"Price"=> {"Total"=>{"sum"=>495.2 }}}
      trip = TripChoice.new(journey)

      cost = trip.roundtrip_cost
      expect(cost).to eq(495.2)
    end
  end

    it "calls Flight.new with flights from the journey" do
      flights =  [
        {
          "arr1"=>"2015-08-08T00:57:00",
          "org"=>"DEN",
          "dst"=>"ATL"
        },
        {
          "arr2"=>"2015-08-21T06:57:00",
          "org"=>"ATL",
          "dst"=>"CLT"
        },
        {
          "arr3"=>"2015-08-21T09:03:00",
          "org"=>"CLT",
          "dst"=>"DEN"
        }
      ]

      journey = { 
        "Flights"=> flights
      }


      trip = TripChoice.new(journey)
      allow(FlightData).to receive(:new)

      trip.flights
      expect(FlightData).to have_received(:new).with(flights.first) 
      expect(FlightData).to have_received(:new).with(flights.second) 
      expect(FlightData).to have_received(:new).with(flights.third) 
    end

end