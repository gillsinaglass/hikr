class HikesController < ApplicationController
  
  before_action :get_hike, only: [:show]

  def index
    @hikes = Hike.all
  end

  def show
  end

  def new
    @hike = Hike.new
  end

  def create
    @hike = Hike.new(hike_params)
    if @hike.save
      redirect_to @hike
    else
      render :new
    end
  end

  def destroy
    Hike.destroy(params[:id])
    redirect_to hikes_path
  end

  private

  def get_hike
    @hike = Hike.find(params[:id])
  end

  def hike_params
    params.require(:hike).permit(:user_id, :trail_id, :start_time, :end_time, :rating)
  end
end
