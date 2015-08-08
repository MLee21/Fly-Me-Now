require "rails_helper"

RSpec.describe FlightInformationService do 
  vcr_options = { allow_playback_repeats: true }

  it "returns flights" do

    VCR.use_cassette("get_flights", vcr_options) do 
      Timecop.freeze("2015-08-07") do
        location = "DEN"
        service = FlightInformationService.new(location)

        flights = service.flights_by_location
        expect(flights).to be_an_instance_of(TripChoice)
      end
    end
  end

end