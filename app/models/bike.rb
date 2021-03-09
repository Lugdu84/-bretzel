class Bike < ApplicationRecord
  belongs_to :user
  validates :description, :price, :name, :photo, presence: true
  # validates :price, numericality: true
  # validates :price, numericality: { only_integer: true }
end


