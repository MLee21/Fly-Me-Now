require "rails_helper"

RSpec.describe FlightData do 
  describe "#original_airport" do 
    it "returns the city of origin" do 
     
      data = { "Flights"=>
        [
          {
            "org"=>"DEN",
            "dst"=>"ATL"
          },
          {
            "org"=>"ATL",
            "dst"=>"CLT"
          },
          {
            "org"=>"CLT",
            "dst"=>"DEN"
          }
        ]
      }

      flight = FlightData.new(data)
      original_airport = flight.original_airport

      expect(original_airport).to eq("DEN")
    end
  end

  describe "#destination" do 
    it "returns the destination city" do 
       data = { "Flights"=>
        [
          {
            "org"=>"DEN",
            "dst"=>"ATL"
          },
          {
            "org"=>"ATL",
            "dst"=>"CLT"
          },
          {
            "org"=>"CLT",
            "dst"=>"DEN"
          }
        ]
      }

      flight = FlightData.new(data)
      destination = flight.destination

      expect(destination).to eq("ATL")
    end
  end

  describe "#number" do 
    it "returns the flight_number" do 
       data = { "Flights"=>
        [
          {
           "num"=>"3905"
          },
          {
         "num"=>"3906"
          },
          {
        "num"=>"3995"
          }
        ]
      }

      flight = FlightData.new(data)
      number = flight.number

      expect(number).to eq("3905")
    end
  end

  describe "#departure_time" do 
    it "returns the departure_time" do 
       data = { "Flights"=>
        [
          {
           "dep"=>"2015-08-07T19:50:00"
          },
          {
         "dep"=>"2015-08-07T19:50:00"
          },
          {
        "dep"=>"2015-08-07T19:50:00"
          }
        ]
      }

      flight = FlightData.new(data)
      departure_time = flight.departure_time

      expect(departure_time).to eq("2015-08-07T19:50:00")
    end
  end

  describe "#arrival_time" do 
    it "returns the arrival_time" do 
       data = { "Flights"=>
        [
          {
          "dep"=>"2015-08-07T19:50:00"
          },
          {
         "dep"=>"2015-08-07T19:50:00"
          },
          {
        "dep"=>"2015-08-07T19:50:00"
          }
        ]
      }

      flight = FlightData.new(data)
       departure_time = flight.departure_time

      expect(departure_time).to eq("2015-08-07T19:50:00")
    end
  end
end