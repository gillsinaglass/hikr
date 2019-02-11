class Shelter < ApplicationRecord
  belongs_to :trail
  has_many :users, through: :breaks
  has_many :breaks

  #returns breaks at a specific shelter
  def breaks_at_shelter
    Break.all.select do |b|
      b.shelter_id == self.id
    end
  end

  def review_blank
    review_array = self.breaks_at_shelter.collect do |b|
      if b.review == nil
        review_array = nil
      else
        review_array = "#{b.user.username} - #{b.review}"
      end
    end
  end

  def self.most_visited_shelter
    Shelter.all.max_by do |shelter|
    shelter.breaks_at_shelter.count
    end
  end

  def self.most_visited_shelter_count
    Shelter.most_visited_shelter.breaks_at_shelter.count
  end

  def self.percentage_of_visitors
    (Shelter.most_visited_shelter_count / Break.all.count.to_f*100).round(2)
  end

  def shelter_ratings
    a = Break.all.map do |b|
      b.rating
    end
    a.compact!
  end

  def avg_rating
    self.shelter_ratings.reduce(:+)/self.shelter_ratings.length.to_f
  end

  def self.highest_rated_shelter
    Shelter.all.max_by do |shelter|
    shelter.avg_rating
    end
  end



end
