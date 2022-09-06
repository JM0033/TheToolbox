class RoutePointsController < ApplicationController
  before_action :getUserCoordinates, only: :get_points
  def get_points
    @ip = "85.204.70.90" # à remplacer par user_ip avant mise en prod
    results = Geocoder.search(@ip)
    results.first.coordinates
    @userLat = -23.097688
    @userLgn = -68.090525
    @coordinates = params[:coordinates]
    route_coordinates = [{ "longitude" => @userLgn, "latitude" => @userLat }, @coordinates]
    results = GetRoutePoints.new(route_coordinates).call # Hash points/distance/duration
    render json: { points: results[:points], distance: results[:distance], duration: results[:duration] }.to_json
  end

  private

  def user_ip
    request.remote_ip
  end
end
