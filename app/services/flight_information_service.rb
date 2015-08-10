require 'time'

class FlightInformationService
  attr_reader :connection, :today, :origin_airport_code, :destination_airport_code

  def initialize(origin_airport_code, destination_airport_code)
    @origin_airport_code = origin_airport_code
    @destination_airport_code = destination_airport_code
    @connection = Hurley::Client.new("http://fs-json.demo.vayant.com")
    @today = Date.today
  end

  def flights_by_location
    response = connection.post("/") do |request|
      request.header[:content_type] = "application/json"
      request.body = JSON.generate({
        Version: 2.7,
        DepartureFrom: today.iso8601,
        DepartureTo: today.tomorrow.iso8601,
        User: "Minnie.lee89@gmail.com", 
        Pass: "0da933f3c6e6d8199ed02797b2e7f538e01e4a72", 
        Origin: origin_airport_code, 
        Destination: destination_airport_code,
        PriceMax: 600,
        Response: "json",
        Environment: "fast_search_1_0"
      })
    end

    journeys = parse(response.body)["Journeys"]

    unless journeys.empty?
      journey = journeys[0][0]
      TripChoice.new(journey)
    end
  end

  private

  def parse(response)
    JSON.parse(response)
  end

end