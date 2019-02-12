class User < ApplicationRecord
  has_many :hikes
  has_many :trails, through: :hikes
  has_many :breaks
  has_many :shelters, through: :breaks
  # has_secure_password

  has_one_attached :photo
end
