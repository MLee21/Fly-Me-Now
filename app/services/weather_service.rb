class WeatherService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new 'http://api.wunderground.com/'
    # @connection = Hurley::Client.new "http://api.wunderground.com/api/#{ENV['weather_api_key']}"
  end

  def forecast_data(state, city)
    response = parse(connection.get("api/#{ENV['weather_api_key']}/forecast/q/#{state}/#{city}.json"))
    response[:forecast][:simpleforecast][:forecastday]
  end

  private
  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end

