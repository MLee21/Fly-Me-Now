class FlightsController < ApplicationController

  def index
    iata_conversion_service = IataConversionService.new
    origin_airport_code = iata_conversion_service.main_iata_code(params[:origin_city])
    destination_airport_code = iata_conversion_service.main_iata_code(params[:destination_city])
    flight_information_service = FlightInformationService.new(origin_airport_code, destination_airport_code)
require 'pry';binding.pry
    trip_choice = flight_information_service.flights_by_location
    
    if trip_choice.nil?
      render status: 204, nothing: true
    else
      render json: trip_choice.to_json
    end
  end

end