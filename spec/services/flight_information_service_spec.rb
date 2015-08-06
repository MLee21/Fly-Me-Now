require "rails_helper"

RSpec.describe 'FlightInformationService', type: :model do 
  attr_reader :service 

  before(:each) do 
    @service = FlightInformationService.new
  end

  it "returns flights" do
    VCR.use_cassette("get_flights") do 
      location = "DEN"
      flights = service.flights_by_location(location)
      expect(flights).to be_an_instance_of(Hash)
    end
  end

  it "returns information for flights" do 
    VCR.use_cassette("get_flights") do 
      location = "DEN"
      flights = service.flights_by_location(location)
      expect(flights["Journeys"]).to eq("First Responders")
    end
  end

end