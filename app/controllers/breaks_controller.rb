class BreaksController < ApplicationController
  
  before_action :get_break, only: [:show]

  def index
    @breaks = Break.all
  end

  def show
  end

  def new
    @break = Break.new
  end

  def create
    @break = Break.new(break_params)
    if @break.save
      redirect_to @break
    else
      render :new
    end
  end

  private

  def get_break
    @break = Break.find(params[:id])
  end

  def break_params
    params.require(:break).permit(:user_id, :shelter_id, :start_time, :end_time, :review)
  end
end
