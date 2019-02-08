class Shelter < ApplicationRecord
  belongs_to :trail
  has_many :users, through: :breaks

end
