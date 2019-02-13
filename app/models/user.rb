class User < ApplicationRecord
  has_many :hikes
  has_many :trails, through: :hikes
  has_many :breaks
  has_many :shelters, through: :breaks
  has_one_attached :photo

  has_secure_password

  def hikes_by_user
    user_breaks = Hike.all.select do |b|
      b.user_id == self.id
    end
  end

  def shelters_visited
    user_breaks = Break.all.select do |b|
      b.user_id == self.id
    end
    shelter_ids = user_breaks.map {|b| b.shelter_id }
    shelters = []
    shelter_ids.each do |id|
      shelters << Shelter.find(id)
    end
    shelters
  end

  def favorite_shelter
    user_breaks = Break.all.select do |b|
      b.user_id == self.id
    end
    if user_breaks.nil?
      "You have never visited a shelter"
    else
      id = user_breaks.max_by {|b| b.rating }
    end
    id.shelter.name
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
