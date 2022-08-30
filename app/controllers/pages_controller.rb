class PagesController < ApplicationController
  def home
    render plain: "Your IP: #{user_ip}"
  end

  private

  def user_ip
    request.ip
  end
end
