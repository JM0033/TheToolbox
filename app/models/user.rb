class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :meeting_points, foreign_key: :requestor_id, class_name: "MeetingPoint"
  has_many :meeting_points, foreign_key: :helper_id, class_name: "MeetingPoint"
  has_one_attached :photo

  has_many :chatrooms,
            ->(user) {
              unscope(where: :user_id)
              .where("first_user_id = :user_id OR second_user_id = :user_id", user_id: user.id)
            },
            class_name: 'Chatroom',
            dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :biker_status, inclusion: { in: ["untrained", "average", "in good shape", "athletic", "pro"] }, allow_nil: true
end
