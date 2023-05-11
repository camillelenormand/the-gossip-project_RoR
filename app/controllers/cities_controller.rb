class CitiesController < ApplicationController
  include SessionsHelper
  
  def show
    @id = City.find(params[:id])
    @cities_users = User.where(city_id: @id)
    @gossips = Gossip.where(user_id: @cities_users)
  end
end
