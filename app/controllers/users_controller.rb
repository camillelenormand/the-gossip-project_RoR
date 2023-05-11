class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end


  def show
    @id = params[:id].to_i
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    if @user.save
      redirect_to '/welcome', success: "User successfully created"
    else
      render 'new'
    end
  end


  private
  def user_params
    params.require(:user).permit(:email, :password, :username)
  end

end
