class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      if @user.admin?
        redirect_to shelters_path
      else
      redirect_to users_path
      end
    else
      flash["notice"] = "No user found with that name."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
