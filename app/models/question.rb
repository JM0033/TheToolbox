class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  validates :content, presence: true
  validates :title, presence: true
end
