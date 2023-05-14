class SessionsController < ApplicationController
  include SessionsHelper

  # GET /sessions/new
  def new
    @user = User.new
  end

  # POST /sessions
  def create
    user = User.find_by(email: params[:email])

    if user.present? && user.authenticate(params[:password])
      log_in(user)

      # remember user
      remember(user)
      redirect_to gossips_path, success: "Logged in successfully"

    else
      flash[:alert] = "Invalid email or password"
      render :new
    end

  end

  # delete /sessions
  def destroy
    log_out
    redirect_to root_path, success: "Logged out successfully"
  end

end
