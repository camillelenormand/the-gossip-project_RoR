class GossipsController < ApplicationController

  def index
    @gossip = Gossip.all
  end

  def show
    @id = params[:id]
  end

  def create 
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: rand(1..100))
  end
end
