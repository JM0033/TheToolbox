class AddCoordinatesToMeetingPoints < ActiveRecord::Migration[7.0]
  def change
    add_column :meeting_points, :latitude, :float
    add_column :meeting_points, :longitude, :float
  end
end
