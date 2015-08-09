require "rails_helper"
require "pp"

RSpec.describe FlightsController do 
  vcr_options = { allow_playback_repeats: true }
  describe "#index" do 
    it "will return the flights from origin airport" do 
      VCR.use_cassette("flight_controller_data", vcr_options) do 
        Timecop.freeze("2015-08-08") do

          get :index, {city: "Denver"}
          expect(response.status).to eq(200)
          trip_choice = JSON.parse(response.body)
          expect(trip_choice).to eq({
            "Price" => {
              "Total" => {
                "sum"=> 369.19,
              }
            },
            "Flights" => [
              {
                "Origin" => "DEN",
                "Destination" => "CLT",
                "DepartureTime" => "2015-08-08T16:00:00",
                "Arrival" => "2015-08-08T21:18:00",
                "Carrier" => "AA",
                "Flight_Number" => "1901"
              },
              {
                "Origin" => "CLT",
                "Destination" => "FLL",
                "DepartureTime" => "2015-08-08T22:05:00",
                "Arrival" => "2015-08-08T23:56:00",
                "Carrier" => "AA",
                "Flight_Number" => "1717"
              },
              {
                "Origin" => "FLL",
                "Destination" => "CLT",
                "DepartureTime" => "2015-08-15T14:50:00",
                "Arrival" => "2015-08-15T16:59:00",
                "Carrier" => "US",
                "Flight_Number" => "0609"
              },
              {
                "Origin" => "CLT",
                "Destination" => "DEN",
                "DepartureTime" => "2015-08-15T20:25:00",
                "Arrival" => "2015-08-15T21:56:00",
                "Carrier" => "US",
                "Flight_Number" => "0447"
              }
            ]
          }) 
        end
      end
    end
  end
end