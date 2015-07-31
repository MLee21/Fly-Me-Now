class WeatherService
  attr_reader :connection

  def initialize
    @connection = Hurley.new(url: )

  end
end