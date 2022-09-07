class MeetingPointsController < ApplicationController
  def new
    @meeting_point = MeetingPoint.new
    @helper = User.find(params[:user_id])
    @users = User.where(id:[params[:user_id], current_user.id])
    @userLat = current_user.latitude
    @userLgn = current_user.longitude
    @users_markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        # info_window: render_to_string(partial: "shared/user_map_card", locals: { user: user }),
        image_url: helpers.asset_url(current_user == user ? "Bikers.png" : 'Bikers.png')
      }
    end
  end

  def create
    @meeting_point = MeetingPoint.new(params_meeting_point)
    @meeting_point.requestor = current_user
    @meeting_point.helper = User.find(params[:user_id])
    @meeting_point.status = "accepted"
    @meeting_point.latitude = (params[:meeting_point][:latitude])
    @meeting_point.longitude = (params[:meeting_point][:longitude])
    @meeting_point.date_time = (params[:meeting_point][:date_time])
    if @meeting_point.save!
      redirect_to meeting_points_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @meeting_points = current_user.meeting_points
  end

  def edit
  end

  def update
  end


  private

  def params_meeting_point
    params.require(:meeting_point).permit( :date, :latitude, :longitude)
  end
end
