class WeatherService
  attr_reader :connection, :state, :city

  def initialize(state, city)
    @connection = Hurley::Client.new 'http://api.wunderground.com/'
    @state = state
    @city = city
  end

  def forecast_data
    response = parse(connection.get("api/#{ENV['weather_api_key']}/forecast/q/#{state}/#{city}.json"))
    weather_data = response[:forecast][:simpleforecast][:forecastday]
    Forecast.new(weather_data)
  end

  private
  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end



end

