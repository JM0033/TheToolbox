class Chatroom < ApplicationRecord
  belongs_to :first_user, class_name: 'User'
  belongs_to :second_user, class_name: 'User'
  has_many :messages, dependent: :destroy

  def interlocutor_of(user)
    user == first_user ? second_user : first_user
  end
end
