class UsersController < ApplicationController

  before_action :get_user, only: [:show, :edit, :update]


  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to @user
  end

  def destroy
    User.destroy(params[:id])
    redirect_to users_path #redirect to logout page which has not yet been created
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :gear, :photo, :caption, :password)
  end

end
