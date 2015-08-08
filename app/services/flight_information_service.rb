require 'time'

class FlightInformationService
  attr_reader :connection, :date, :location

  def initialize(location)
    @location = location
    @connection = Hurley::Client.new("http://fs-json.demo.vayant.com")
    @date = Time.now.utc.iso8601
  end

  def flights_by_location
    response = connection.get("/", {
      Version: 2.7,
      DepartureFrom: format_date,
      User: "Minnie.lee89@gmail.com", 
      Pass: "0da933f3c6e6d8199ed02797b2e7f538e01e4a72", 
      Origin: location, 
      PriceMax: 500, 
      Response: "json",
      Environment: "fast_search_1_0",
    })
    journey = parse(response.body)["Journeys"][0][0]
    TripChoice.new(journey)
  end

  private

  def parse(response)
    JSON.parse(response)
  end

  def format_date
    new_time = Time.iso8601(date).to_s.slice(0..9)
  end

end