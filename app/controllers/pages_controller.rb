class PagesController < ApplicationController
  def home
    @ip = user_ip
    results = Geocoder.search(@ip)
    results.first.coordinates
    raise
  end

  private

  def user_ip
    request.remote_ip
    # "138.199.16.148"
  end
end
