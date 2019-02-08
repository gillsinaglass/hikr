class Trail < ApplicationRecord
  has_many :shelters
  has_many :hikes
  has_many :users, through: :hikes 
end
