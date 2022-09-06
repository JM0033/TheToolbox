class RoutePointsController < ApplicationController
  def get_points
    @ip = "85.204.70.90" # à remplacer par user_ip avant mise en prod
    results = Geocoder.search(@ip)
    results.first.coordinates
    @userLat = results.first.coordinates[0]
    @userLgn = results.first.coordinates[1]
    @coordinates = params[:coordinates]
    route_coordinates = [{ "longitude" => @userLgn, "latitude" => @userLat }, @coordinates]
    points = GetRoutePoints.new(route_coordinates).call
    render json: { points: points }.to_json
  end

  private

  def user_ip
    request.remote_ip
  end
end
