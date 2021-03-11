class User < ApplicationRecord
  has_many :bikes
  has_many :favorites
  # to access bikes
  has_many :bikes, through: :favorites
  has_many :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
