class GossipsController < ApplicationController

  def index
    @gossip = Gossip.all
  end

  def show
    @id = params[:id]
  end

  def new
    @gossip= Gossip.new
  end

  def create 
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: rand(1..100))
    
    if @gossip.save
      redirect_to gossips_path, success: "Gossip successfully created !"
    else
      redirect_to gossips_path, danger: "Error, gossip not created !"
    end
  end
end
