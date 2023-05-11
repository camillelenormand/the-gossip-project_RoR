class ApplicationController < ActionController::Base
  add_flash_types :danger, :info, :warning, :success
  helper_method :current_user, :logged_in?

  def current_user
    User.find_by(id: session[:current_user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to '/welcome' unless logged_in?
  end
end
