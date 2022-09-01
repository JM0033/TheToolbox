class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  validates :content, presence: true
  validates :title, presence: true
  has_one_attached :photo

  include PgSearch::Model

  pg_search_scope :search_by_title_and_content,
                  against: %i[title content],
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }
end
