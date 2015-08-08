class TripChoice
  attr_reader :journey

  def initialize(journey)
    @journey = journey
  end

  def roundtrip_cost
    journey["Price"]["Total"]["sum"]
  end

  def flight_data
    #returns all Flight objects for one trip
    journey["Flights"].map { |flight| FlightData.new(flight) }

  end



end