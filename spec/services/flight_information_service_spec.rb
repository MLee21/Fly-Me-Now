require "rails_helper"

RSpec.describe 'FlightInformationService', type: :model do 
  attr_reader :service 

  before(:each) do 
    @service = FlightInformationService.new
  end

  it "returns flights" do
    VCR.use_cassette("get_flights") do 
      location = "Denver, CO"
      flights = service.flights_by_location(location)
      expect(flights).to be_an_instance_of(Array)
    end
  end

end