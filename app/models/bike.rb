class Bike < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :favorites
  validates :description, :price, :name, :photo, presence: true
  # validates :price, numericality: true
  # validates :price, numericality: { only_integer: true }
end
