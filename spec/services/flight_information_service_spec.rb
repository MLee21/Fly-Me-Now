require "rails_helper"

RSpec.describe 'FlightInformationService', type: :model do 
  attr_reader :service 

  before(:each) do 
    @service = FlightInformationService.new
  end

  it "returns flights" do
    VCR.use_cassette("get_flights") do 
      location = "DEN"
      price = 1000
      flights = service.flights_by_location(location, price)
      expect(flights).to be_an_instance_of(Hash)
    end
  end

  xit "returns information for flights" do 
    VCR.use_cassette("get_flights") do 
      location = "DEN"
      price = 1000
      flights = service.flights_by_location(location, price)
      expect(flights["Journeys"]).to eq("First Responders")
    end
  end

end