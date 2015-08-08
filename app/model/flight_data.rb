class FlightData
  attr_reader :flight_data

  def initialize(data)
    @flight_data = data
  end

  def original_airport
    flight_data["Flights"].first["org"]
  end

  def destination
    flight_data["Flights"].first["dst"] 
  end

  def number
    flight_data["Flights"].first["num"] 
  end

  def departure_time
    flight_data["Flights"].first["dep"] 
  end

end