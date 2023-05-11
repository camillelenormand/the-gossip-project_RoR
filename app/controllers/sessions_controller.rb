class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]


  # GET /sessions/new
  def new
    @user = User.new
  end

  def login
    
  end

  # POST /sessions
  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/welcome'
    else
      redirect_to '/login'
    end
  end

  # delete /sessions
  def destroy
    session.delete(:current_user_id)
    # Clear the memoized current user
    @_current_user = nil
    redirect_to new_session_path, success: "Logged out!"
  end

  def page_requires_login

  end

end
