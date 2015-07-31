require "rails_helper"

RSpec.describe 'WeatherInformationService', type: :model do 
  attr_reader :service 

  before(:each) do 
    @service = WeatherInformationService.new
  end

  it "return weather" do
    VCR.use_cassette("get_weather") do 
      location = "Denver, CO"
      weather = service.three_day_forecast(location)
      expect(weather).to be_an_instance_of(Array)
    end
  end

end