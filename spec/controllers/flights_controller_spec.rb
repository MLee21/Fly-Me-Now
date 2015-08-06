require "rails_helper"
require "pp"

RSpec.describe FlightsController do 
  describe "#index" do 
    it "will return the flights from origin airport" do 
      VCR.use_cassette("flight_controller_data", re_record_interval: 1000000) do 
        get :index, {city: "Denver"}
        expect(response.status).to eq(200)
        trips = JSON.parse(response.body)
        expect(trips.first).to eq({
          Total_Price: 453.21,
          Flights: [
            [
              {
                Origin: "DEN",
                Destination: "DTW",
                DepartureTime: "2015-08-06T13:55:00",
                Arrival: "2015-08-06T18:45:00",
                
                Carrier: "DL",
                Seats: 1,
                Flight_Number: 1645
              },
              {
                Origin: "DTW",
                Destination: "FLL",
                DepartureTime: "2015-08-06T20:10:00",
                Arrival: "2015-08-06T23:09:00",
                Carrier: "DL",
                Seats: 1,
                Flight_Number: 0021
              }
            ],
            [
              {
                Origin: "FLL",
                Destination: "ATL",
                DepartureTime: "2015-08-13T18:45:00",
                Arrival: "2015-08-13T20:50:00",
                Carrier: "DL",
                Seats: 1,
                Flight_Number: 1527
              },
              {
                Origin: "ATL",
                Destination: "DEN",
                DepartureTime: "2015-08-13T21:55:00",
                Arrival: "2015-08-13T23:14:00",
                Carrier: "DL",
                Seats: 1,
                Flight_Number: 2103
              }
            ]
          ]
        }) 
        
        # pp JSON.parse(response.body)

      end
    end
  end
end