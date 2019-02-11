class Hike < ApplicationRecord
  belongs_to :trail
  belongs_to :user

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

  def length_of_hike
    if @end_time == "Pending"
      @length_of_hike = nil
    else
      d = DateTime.parse((self.created_at - self.updated_at).to_s)
      @hike_minutes = d.strftime('%M')
      @length_of_hike = @hike_minutes + " minutes"
    end
  end

  def get_trail_length
    @trail_length = self.trail.distance
  end

  def avg_mile_pace
    avg = @hike_minutes.to_f / @trail_length.to_f
    sec = (avg.round(3) * 60).to_i
    min, sec = sec.divmod(60)
    hour, min = min.divmod(60)
    return "%02d:%02d:%02d" % [hour, min, sec] + " per mile"
  end
end
