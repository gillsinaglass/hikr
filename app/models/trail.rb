class Trail < ApplicationRecord
  has_many :shelters
  has_many :hikes
  has_many :users, through: :hikes

  def hikes_on_trail
    Hike.all.select do |t|
      t.trail_id == self.id
    end
  end

  def trail_rating
    a = self.hikes_on_trail.collect do |hike|
      hike.rating
    end
     @@rating = a.inject{ |sum, el| sum + el }.to_f / a.size
  end


  def all_trail_ratings
    a = Hike.all.map do |b|
      b.rating
    end
    a.compact!
  end

  def users_on_trail
    a = self.hikes_on_trail.collect do |hike|
      hike.user
    end
  end

  def avg_rating
    self.all_trail_ratings.reduce(:+)/self.all_trail_ratings.length.to_f
  end

  def self.highest_rated_trail
    Trail.all.max_by do |trail|
    trail.trail_rating
    end
  end

  def self.most_difficult_trail
    Trail.all.max_by do |trail|
    trail.difficulty_level
    end
  end



end
