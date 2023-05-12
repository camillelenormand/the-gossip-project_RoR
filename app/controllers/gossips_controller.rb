class GossipsController < ApplicationController
  include SessionsHelper

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
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: current_user.id, city_id: 1)
      
      if @gossip.save
        redirect_to gossips_path, success: "Gossip successfully created !"
      else
        @gossip.errors.full_messages.each do |message|
        redirect_to new_gossip_path, danger: message
      end
    end
  end

  def update
    @gossip = Gossip.find(params[:id])
  
    if @gossip.update(title: params[:title], content: params[:content], user_id: current_user.id)
      redirect_to gossips_path, success: "Gossip successfully updated !"
    else
      @gossip.errors.full_messages.each do |message|
      redirect_to edit_gossip_path(@gossip), danger: message
      end
      render :edit
    end
  end

  def destroy 
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    
    if @gossip.destroy
      redirect_to gossips_path, success: "Gossip successfully deleted !"
    else
      redirect_to gossips_path, danger: "Gossip not deleted !"
    end
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content, :user_id)
  end

end
