class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  private

  def getUserCoordinates
    @ip = "85.204.70.90" # à remplacer par user_ip avant mise en prod
    results = Geocoder.search(@ip)
    results.first.coordinates
    # @userLat = results.first.coordinates[0]
    # @userLgn = results.first.coordinates[1]
    @userLat = -23.097688
    @userLgn = -68.090525
  end

  def user_ip
    request.remote_ip
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:description, :biker_status, :bike_model, :language])
  end
end
