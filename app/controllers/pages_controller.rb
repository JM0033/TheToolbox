class PagesController < ApplicationController
  def home
    @ip = user_ip
    results = Geocoder.search(@ip)
    results.first.coordinates
  end

  private

  def user_ip
    request.remote_ip
  end
end
