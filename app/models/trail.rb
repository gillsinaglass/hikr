class Trail < ApplicationRecord
  has_many :shelters
  has_many :hikes
  has_many :users, through: :hikes

  def hikes_on_trail
    Hike.completed_hikes.select do |t|
      t.trail_id == self.id
    end
  end

  def trail_rating
    trailRatingArr = self.hikes_on_trail.collect do |hike|
      hike.rating
    end
    if trailRatingArr.any?
      return (trailRatingArr.sum/trailRatingArr.size.to_f).round(1)
    else
      return "No Ratings!"
    end
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
    a.uniq
  end

  def avg_rating
    self.all_trail_ratings.reduce(:+)/self.all_trail_ratings.length.to_f
  end

  def self.rated_trails
    Trail.all.select do |trail|
      trail.trail_rating != "No Ratings!"
    end
  end

  def self.highest_rated_trail
    # max by Trails that have ratings, not all trails
    # We need to write a rated_trails method, as in shelter model
    if self.rated_trails.any?
      return self.rated_trails.max_by do |trail|
        trail.trail_rating
      end
    else 
      Trail.last
    end
  end

 

  def self.most_difficult_trail
    Trail.all.max_by do |trail|
    trail.difficulty_level
    end
  end

end
