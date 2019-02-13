class SheltersController < ApplicationController

  before_action :get_shelter, only: [:show]
  before_action :admin_authorize, only: [:create, :new]
  before_action :authorized

  def index
    @shelters = Shelter.all
  end

  def show
  end

  def new
    @shelter = Shelter.new
  end

  def create
    @shelter = Shelter.new(shelter_params)
    if @shelter.save
      redirect_to @shelter
    else
      render :new
    end
  end

  private

  def get_shelter
    @shelter = Shelter.find(params[:id])
  end

  def shelter_params
    params.require(:shelter).permit(:name, :location, :description, :trail_id)
  end

end
