class TripChoice
  attr_reader :journey

  def initialize(journey)
    @journey = journey
  end

  def roundtrip_cost
    journey["Price"]["Total"]["sum"]
  end

  def flights
    #returns all Flight objects for one trip
    journey["Flights"].map { |flight| FlightData.new(flight) }

  end

  def as_json(options={})
    { "Price" => {"Total"=> { "sum"=> roundtrip_cost }}, "Flights" => flights }

  end
end