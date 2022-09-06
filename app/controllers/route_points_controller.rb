class RoutePointsController < ApplicationController
  before_action :getUserCoordinates, only: :get_points
  def get_points
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
