class Break < ApplicationRecord
  belongs_to :user
  belongs_to :shelter
  validates :rating, presence: true, on: :update

  def self.completed_breaks
    Break.all.select do |br|
      br.updated_at != br.created_at
    end
  end

  def start_time
    d = DateTime.parse(self.created_at.to_s)
    @start_time = d.strftime('%I:%M %p')
  end

  def end_time
    if self.updated_at == self.created_at
      @end_time = self.updated_at = "Pending"
    else
      d = DateTime.parse(self.updated_at.to_s)
      @end_time = d.strftime('%I:%M %p')
    end
  end

  def length_of_break
    if @end_time == "Pending"
      return nil
    else
      d = DateTime.parse((self.created_at - self.updated_at).to_s)
      d.strftime('%M minutes')
    end
  end
end
