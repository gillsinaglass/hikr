class User < ApplicationRecord
  has_many :hikes
  has_many :trails, through: :hikes
  has_many :breaks
  has_many :shelters, through: :breaks
  has_one_attached :photo

  has_secure_password

  def hikes_by_user
    user_hikes = Hike.all.select do |b|
      b.user_id == self.id
    end
  end

  def breaks_by_user
    user_breaks = Break.all.select do |b|
      b.user_id == self.id
    end
  end

  def shelters_visited_by_user
    shelter = self.breaks_by_user.collect {|b| b.shelter }
    shelter.compact
  end

  def favorite_shelter
    self.shelters_visited_by_user.max_by {|s| s.shelter_rating }
  end

  def trails_hiked_by_user
      trail = self.hikes_by_user.collect {|h| h.trail}
        trail.compact
  end

  def favorite_trail
      self.trails_hiked_by_user.max_by do |trail|
        trail.trail_rating
      end
  end

end
