class ApplicationController < ActionController::Base

  helper_method :current_user
  helper_method :admin_authorize
  helper_method :logged_in?

  def current_user
    if session[:user_id]
      User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    flash["notice"] = "You must be logged in to view that page."
    redirect_to login_path unless logged_in?
  end

  def admin?
    !!current_user.admin
  end

  def admin_authorize
    if !current_user.admin?
      flash[:notice] = "you must be an admin to access this page"
      redirect_to users_path
    end
  end

end
