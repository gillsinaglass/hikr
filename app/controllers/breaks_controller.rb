class BreaksController < ApplicationController

  before_action :get_break, only: [:show, :edit, :update]

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

  def edit
  end

  def update
    if @break.update(break_update_params)
      redirect_to @break
    else
      render :edit
    end
  end

  private

  def get_break
    @break = Break.find(params[:id])
  end

  def break_params
    params.require(:break).permit(:user_id, :shelter_id, :start_time, :end_time).merge(review: nil, rating: nil)
  end

  def break_update_params
    params.require(:break).permit(:user_id, :shelter_id, :start_time, :end_time, :review, :rating)
  end
end
