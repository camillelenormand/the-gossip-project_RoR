class UsersController < ApplicationController
  include SessionsHelper

  def new
    @user = User.new
  end

  def show
    @id = params[:id]
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to gossips_path, success: "User successfully created"
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :age, :description, :city_id || 1)
  end
end
