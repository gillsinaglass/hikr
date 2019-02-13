class TrailsController < ApplicationController

  before_action :get_trail, only: [:show]
  # before_action :authorized, except: [:index]

  def index
    @trails = Trail.all
  end

  def show
  end

  def new
    @trail = Trail.new
  end

  def create
    @trail = Trail.new(trail_params)
    if @trail.save
      redirect_to @trail
    else
      render :new
    end
  end

  private

  def get_trail
    @trail = Trail.find(params[:id])
  end

  def trail_params
    params.require(:trail).permit(:description, :difficulty_level, :distance, :name)
  end
end
