class FlightData
  attr_reader :flight_data

  def initialize(data)
    @flight_data = data
  end

  def original_airport
    flight_data["org"]
  end

  def destination
    flight_data["dst"] 
  end

  def number
    flight_data["num"] 
  end

  def departure_time
    flight_data["dep"] 
  end

  def arrival_time
    flight_data["arr"] 
  end

  def airline
    flight_data["mcxr"]
  end

  def as_json(options = {})
    {
      "Origin" => original_airport,
      "Destination" => destination,
      "DepartureTime" => departure_time ,
      "Arrival" => arrival_time, 
      "Carrier" => airline, 
      "Flight_Number" => number
    } 
  end
end