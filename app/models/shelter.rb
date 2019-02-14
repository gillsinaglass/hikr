class Shelter < ApplicationRecord
  belongs_to :trail
  has_many :users, through: :breaks
  has_many :breaks

  #returns breaks at a specific shelter
  def breaks_at_shelter
    Break.completed_breaks.select do |b|
      b.shelter_id == self.id
    end
  end

  def review_blank
    @review_array = self.breaks_at_shelter.collect do |b|
      if b.review != ""
        "#{b.user.username} - '#{b.review}' -- #{b.rating}"
      else
        nil
      end
    end
    @review_array.compact
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
    (Shelter.most_visited_shelter_count / Shelter.all.count.to_f*100).round(2)
  end

  def shelter_rating
    ratingsArr = self.breaks_at_shelter.collect do |br|
      br.rating
    end

    if ratingsArr.any?
      return (ratingsArr.sum/ratingsArr.size.to_f).round(1)
    else
      return "No Ratings!"
    end
  end

  def self.rated_shelters
    Shelter.all.select do |shelter|
      shelter.shelter_rating != "No Ratings!"
    end
  end

  def avg_rating
    self.all_shelter_ratings.reduce(:+)/self.all_shelter_ratings.length.to_f
  end

  def self.highest_rated_shelter
    # byebug

    if self.rated_shelters.any?
      return self.rated_shelters.max_by do |shelter|
        shelter.shelter_rating
      end
    else 
      Shelter.last
    end
  end
end