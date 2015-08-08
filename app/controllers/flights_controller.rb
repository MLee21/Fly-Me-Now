class FlightsController < ApplicationController

  def index
    iata_conversion_service = IataConversionService.new
    iata_code = iata_conversion_service.main_iata_code(params[:city])
    flight_information_service = FlightInformationService.new(iata_code)

    flights = flight_information_service.flights_by_location
    render json: flights
  end

  def show
  end

end