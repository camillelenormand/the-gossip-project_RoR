module SessionsHelper

  # authenticate user
  def authenticate_user
    redirect_to new_session_path, flash: { danger: "Please log in." } unless current_user
  end

  # find current user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    @current_user ||= User.find_by(id: cookies[:user_id]) if cookies[:user_id]
    if @current_user
      remember_token = cookies[:remember_token]
      remember_digest = @current_user.remember_digest
      user_authenticated = BCrypt::Password.new(remember_digest).is_password?(remember_token)
      log_in(@current_user) if user_authenticated
    end
    @current_user
  end

  # remember user
  def remember(user)
    remember_token = SecureRandom.urlsafe_base64
    user.remember(remember_token)
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = remember_token
  end
  
  # Check if user is logged in
  def logged_in?
    !current_user.nil?
  end
  
  # Log in user
  def log_in(user)
    session[:user_id] = user.id
  end

  # Log out user
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  # Delete cookies and remember_digest
  def forget(user)
    user.update_attribute(:remember_digest, nil)
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
  
end
