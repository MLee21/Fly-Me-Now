require "rails_helper"

RSpec.describe WeatherService do 
  attr_reader :service, :state, :city 
  vcr_options = { allow_playback_repeats: true }

  before(:each) do 
    @state = "CO"
    @city = "Denver"
    @service = WeatherService.new(state, city)
  end

  describe "#forecast_data" do
    it "returns a ForecastDay instance" do
      VCR.use_cassette("get_weather", vcr_options) do 
     
        denver_weather = service.forecast_data
        expect(denver_weather).to all(be_a(ForecastDay))
      end
    end

    it "calls ForecastDay.new with the weather data" do
      url = "http://api.wunderground.com/api/#{ENV['weather_api_key']}/forecast/q/#{state}/#{city}.json"
      weather_data = [{ date: "Day 1 of weather data" },
                      { date: "Day 2 of weather data" },
                      { date: "Day 3 of weather data" } 
                     ]
      stub_request(:get, url).
        to_return(
          body: JSON.generate(
            forecast: {
              simpleforecast: { forecastday: weather_data }
            }
          )
        )

      allow(ForecastDay).to receive(:new)

      service.forecast_data
      expect(ForecastDay).to have_received(:new).with(weather_data.first) 
      expect(ForecastDay).to have_received(:new).with(weather_data.second) 
      expect(ForecastDay).to have_received(:new).with(weather_data.third) 
    end
  end
end