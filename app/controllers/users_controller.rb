class UsersController < ApplicationController
  include SessionsHelper

  def new
    @user = User.new
  end


  def show
    @id = params[:id].to_i
  end

  def create
    @user = User.new(
      email: user_params[:email], 
      password: user_params[:password],
      password_confirmation: user_params[:password_confirmation],
    )
  end


  private
  def user_params
    params.require(:user).permit(
    :username,
    :first_name, 
    :last_name, 
    :age, 
    :description, 
    :city_id,
    :email,
    :password,
    :password_confirmation,
    remember_me: [:remember_me]
    )
  end

end
