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
      session[:user_id] = user.id
      redirect_to gossips_path, success: "Logged in successfully"
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end

  # delete /sessions
  def destroy
    log_out
    redirect_to '/welcome', success: "Logged out successfully"
  end

end
