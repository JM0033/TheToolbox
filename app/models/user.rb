class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :meeting_points, foreign_key: :requestor_id, class_name: "MeetingPoint"
  has_many :meeting_points, foreign_key: :helper_id, class_name: "MeetingPoint"
end
