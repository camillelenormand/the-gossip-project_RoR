class SessionsController < ApplicationController

  def new
    @user = User.new
  end

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

  def destroy
    session.delete(:user_id)
  end

end
