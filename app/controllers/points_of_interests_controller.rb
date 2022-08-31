class PointsOfInterestsController < ApplicationController
  def index
    @points_of_interests = PointOfInterest.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @points_of_interests.geocoded.map do |points_of_interest|
      {
        lat: points_of_interest.latitude,
        lng: points_of_interest.longitude
      }
    end
  end

  def show
  end
end
