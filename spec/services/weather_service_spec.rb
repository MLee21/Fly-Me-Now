require "rails_helper"

RSpec.describe 'WeatherService' do 
  attr_reader :service 

  before(:each) do 
    @service = WeatherService.new
  end

  it "returns array of weather data" do
    VCR.use_cassette("get_weather") do 
      state = "CO"
      city = "Denver"

      denver_weather = service.forecast_data(state, city)
      expect(denver_weather).to be_an_instance_of(Array)
    end
  end

end