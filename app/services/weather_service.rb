class WeatherService
  attr_reader :connection, :state, :city

  def initialize(state, city)
    @connection = Hurley::Client.new 'http://api.wunderground.com/'
    @state = state
    @city = city
  end

  def forecast_data
    #returns 3 ForecastDay objects
    response = parse(connection.get("api/#{ENV['weather_api_key']}/forecast/q/#{state}/#{city}.json"))
    weather_data_array = response[:forecast][:simpleforecast][:forecastday]
    weather_data_array.map { |day| ForecastDay.new(day) }
  end

  private
  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end



end

