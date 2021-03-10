class Review < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  validates :note, :description, presence: true
end
