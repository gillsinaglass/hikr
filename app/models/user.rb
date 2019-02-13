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

  def shelters_visited
    shelter_ids = self.breaks_by_user.map {|b| b.shelter }
  end

  def favorite_shelter
    self.shelters_visited.max_by {|b| b.rating }
  end

  def trail_hiked_by_user
    a = self.hikes_by_user.collect do |h|
      h.trail
    end
  end

  def favorite_trail
    a = self.trail_hiked_by_user.max_by do |trail|
      trail.trail_rating
    end
  end

end
