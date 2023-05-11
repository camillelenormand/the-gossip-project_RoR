module SessionsHelper
  def current_user
    User.find_by(id: session[:user_id])
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def log_in(user)
    session[:user_id] = user.id # store user id in session
  end

  def logged_in?
    session[:user_id].present?
  end

  def log_out
    session.delete(:user_id) # delete user id from session
    @current_user = nil # set current user to nil
  end
end
