class PointOfInterest < ApplicationRecord
  has_many_attached :photos
  validates :category, inclusion: { in: ["Tourism", "Campsite", "Bikeshop"] }, allow_nil: false
  validates :name, :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
