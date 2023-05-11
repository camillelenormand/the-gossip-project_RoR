class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  include SessionsHelper

  # GET /sessions/new
  def new
    @user = User.new
  end

  # POST /sessions
  def create
    user = User.find_by(email: params[:email])
    puts "Email: #{params[:email]}"
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully"
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end

  # delete /sessions
  def destroy
    log_out
    redirect_to '/welcome'

  end

  def page_requires_login

  end

end
