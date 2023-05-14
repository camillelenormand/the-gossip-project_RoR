module SessionsHelper

  # authenticate user
  def authenticate_user
    redirect_to new_session_path, flash: { danger: "Please log in." } unless current_user
  end

  # find current user
  def current_user
    if session[:user_id]
      current_user = User.find_by(id: session[:user_id])
    elsif cookies[:user_id]
      user = User.find_by(id: cookies[:user_id])
      if user
        remember_token = cookies[:remember_token]
        remember_digest = user.remember_digest
        user_authenticated = BCrypt::Password.new(remember_digest).is_password?(remember_token)
        if user_authenticated
          log_in user
          current_user = user
        end
      end
    end
  end


  # Log in user
  def log_in(user)
    session[:user_id] = user.id
  end

  # Check if user is logged in
  def logged_in?
    !current_user.nil?
  end

  # Log out user
  def log_out
    session.delete(:user_id)
    forget(current_user)
    current_user = nil
  end

  # remember user
  def remember(user)
    remember_token = SecureRandom.urlsafe_base64
    user.remember(remember_token)
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = remember_token
  end

  # Delete cookies and remember_digest
  def forget(user)
    user.update(remember_digest: nil) unless user.nil?
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
  
end
