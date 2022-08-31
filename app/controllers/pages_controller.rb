class PagesController < ApplicationController
  def home
    @ip = "152.89.163.228" # à remplacer par user_ip avant mise en prod
    results = Geocoder.search(@ip)
    results.first.coordinates
    @userLat = results.first.coordinates[0]
    @userLgn = results.first.coordinates[1]

    @points_of_interests = PointOfInterest.all
    # The `geocoded` scope filters only POI with coordinates
    @markers = @points_of_interests.geocoded.map do |point_of_interest|
      {
        lat: point_of_interest.latitude,
        lng: point_of_interest.longitude,
        info_window: render_to_string(partial: "points_of_interests/info_window", locals: { point_of_interest: point_of_interest }),
        image_url: helpers.asset_url("#{point_of_interest.category}.png")

      }
    end
  end

  private

  def user_ip
    request.remote_ip
  end
end
