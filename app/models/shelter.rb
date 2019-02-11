class Shelter < ApplicationRecord
  belongs_to :trail
  has_many :users, through: :breaks

  def get_reviews
    Break.all.select do |b|
      b.shelter_id == self.id
    end
  end

  end
