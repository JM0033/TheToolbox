class CreateMeetingPoints < ActiveRecord::Migration[7.0]
  def change
    create_table :meeting_points do |t|
      t.string :address
      t.string :status
      t.integer :requestor_id
      t.integer :helper_id
      t.date :date

      t.timestamps
    end
  end
end
