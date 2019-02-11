class Shelter < ApplicationRecord
  belongs_to :trail
  has_many :users, through: :breaks

  #returns breaks at a specific shelter
  def breaks_at_shelter
    Break.all.select do |b|
      b.shelter_id == self.id
    end
  end

  def review_blank
    array = self.breaks_at_shelter.collect do |b|
      if b.review == nil
        array = nil
      else
        array = "#{b.user.username} - #{b.review}"
      end
    end
  end


end
