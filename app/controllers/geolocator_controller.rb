class GeolocatorController < ApplicationController
  respond_to :json

  def create
    session[:city] = params["city"]
    byebug
    respond_with session, location: flights_path
  end
end