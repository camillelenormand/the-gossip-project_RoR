class SessionsController < ApplicationController

  # GET /sessions/new
  def new
    @user = User.new
  end

  # POST /sessions
  def create
    # find existing user
    user = User.find_by(email: params[:email])

    # check if user exists and password is correct
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to gossips_path, success: "Logged in!"
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  # delete /sessions
  def destroy
    session.delete(:user_id)
    redirect_to new_session_path, success: "Logged out!"
  end

end
