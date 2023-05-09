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
      @gossip.errors.full_messages.each do |message|
      redirect_to new_gossip_path, danger: message
    end
    end
  end
end
