class AddDateTimeToMeetingPoints < ActiveRecord::Migration[7.0]
  def change
    add_column :meeting_points, :date_time, :datetime
  end
end
