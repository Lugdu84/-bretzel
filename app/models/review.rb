class Review < ApplicationRecord
  belongs_to :user
  validates :note, :description, presence: true
end
