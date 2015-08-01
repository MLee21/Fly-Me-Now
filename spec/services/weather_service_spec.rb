require "rails_helper"

RSpec.describe 'WeatherService' do 
  attr_reader :service, :state, :city 
  vcr_options = { allow_playback_repeats: true }

  before(:each) do 
    @state = "CO"
    @city = "Denver"
    @service = WeatherService.new(state, city)
  end

  describe "#forecast_data" do
    it "returns a Forecast instance" do
      VCR.use_cassette("get_weather", vcr_options) do 
     
        denver_weather = service.forecast_data
        expect(denver_weather).to be_an_instance_of(Forecast)
      end
    end

    it "calls Forecast.new with the weather data" do
      url = "http://api.wunderground.com/api/#{ENV['weather_api_key']}/forecast/q/#{state}/#{city}.json"
      weather_data = [ "3 days of weather data"]
      stub_request(:get, url).
        to_return(
          body: JSON.generate(
            forecast: {
              simpleforecast: { forecastday: weather_data }
            }
          )
        )

      allow(Forecast).to receive(:new)

      service.forecast_data
      expect(Forecast).to have_received(:new).with(weather_data) 
    end
  end
end