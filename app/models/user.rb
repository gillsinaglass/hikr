class User < ApplicationRecord
  has_many :hikes
  has_many :trails, through: :hikes
  has_many :breaks
  has_many :shelters, through: :breaks
  has_one_attached :photo

  has_secure_password

  def hikes_by_user
    user_hikes = Hike.completed_hikes.select do |b|
      b.user_id == self.id
    end
  end

  def breaks_by_user
    user_breaks = Break.completed_breaks.select do |b|
      b.user_id == self.id
    end
  end

  def shelters_visited_by_user
    shelter = self.breaks_by_user.collect {|b| b.shelter }
    shelter.compact
  end

  def favorite_shelter
    if self.shelters_visited_by_user.size >= 1
      # All shelters visited by user should have ratings, so this should not break
    arr = self.shelters_visited_by_user.max_by {|s| s.shelter_rating}
  else
    arr = Shelter.all.sample
  end
  end

  def trails_hiked_by_user
      trail = self.hikes_by_user.collect {|h| h.trail}
        trail.compact
  end

  def favorite_trail
      if self.trails_hiked_by_user.size >= 1
      arr = self.trails_hiked_by_user.max_by do |trail|
        trail.trail_rating
      end
    else
      arr = Trail.all.sample
    end
  end

end
