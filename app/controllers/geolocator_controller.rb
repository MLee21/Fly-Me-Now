# class GeolocatorController < ApplicationController
#   respond_to :json

#   def create
#     session[:origin_city] = params["city"]
#     respond_with session, location: flights_path
#   end
# end