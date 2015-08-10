require 'time'

class FlightInformationService
  attr_reader :connection, :date, :origin_airport_code, :destination_airport_code

  def initialize(origin_airport_code, destination_airport_code)
    @origin_airport_code = origin_airport_code
    @destination_airport_code = destination_airport_code
    @connection = Hurley::Client.new("http://fs-json.demo.vayant.com")
    @date = Time.now.utc.iso8601
  end

  def flights_by_location
    response = connection.get("/", {
      Version: 2.7,
      DepartureFrom: format_date,
      User: "Minnie.lee89@gmail.com", 
      Pass: "0da933f3c6e6d8199ed02797b2e7f538e01e4a72", 
      Origin: origin_airport_code, 
      Destination: destination_airport_code,
      PriceMax: 700, 
      Response: "json",
      Environment: "fast_search_1_0",
    })

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

  def format_date
    new_time = Time.iso8601(date).to_s.slice(0..9)
  end

end