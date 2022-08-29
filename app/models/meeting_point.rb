class MeetingPoint < ApplicationRecord
  belongs_to :requestor_id, class_name: "User"
  belongs_to :helper_id, class_name: "User"
end
