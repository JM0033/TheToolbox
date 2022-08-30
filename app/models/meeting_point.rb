class MeetingPoint < ApplicationRecord
  belongs_to :requestor_id, class_name: "User"
  belongs_to :helper_id, class_name: "User"

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
