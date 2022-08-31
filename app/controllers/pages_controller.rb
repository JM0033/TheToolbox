class PagesController < ApplicationController
  def home
    @ip = "152.89.163.228"
    results = Geocoder.search(@ip)
    results.first.coordinates
    @userLat = results.first.coordinates[0]
    @userLgn = results.first.coordinates[1]
  end

  private

  def user_ip
    request.remote_ip
  end
end
