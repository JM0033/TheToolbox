class MeetingPoint < ApplicationRecord
  belongs_to :requestor, class_name: "User"
  belongs_to :helper, class_name: "User"

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
